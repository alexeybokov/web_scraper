class Scrapper
  def initialize
    @agent = Mechanize.new
    agent.get('http://webprod1.isbe.net/ILEARN/')
    agent.page.forms_with(action: '/ILEARN/Content/SearchData')[0].submit
    agent.page.uri
  end

  def last_page
    @last_page ||= agent.page.search('.col-md-offset-4').text[/(\d+)(\d+)/].delete_suffix('12345678910').to_i
  end

  def last_paginate
    last_page + 1
  end

  def district_links(agent)
    agent.page.links_with(href: /(RCDTSeclected)/)
  end

  def run!
    (84..last_paginate).each do |page|
      district_links(agent).each do |link|

        parser = Parser.new(link.click)

        puts "Page number: #{page}"
        puts agent.page.uri

        ActiveRecord::Base.connection.execute(SqlFormatter.query_for_ilearn_districts(parser))
        puts "Inserting District: #{parser.name}"

        ilearn_districts_id = ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_ilearn_district_id(parser))[0]['id']

        ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_receipts_revenues(parser, ilearn_districts_id))
        puts "Inserting Data to table 'receipts_revenues': ./................................................"

        ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_ilearn_student_info(parser, ilearn_districts_id))
        puts "Inserting Data to table 'ilearn_student_info': ................................................"





      #
      #   daily_attendance_evg      = info[31].text
      #   statewide_ada             = info[33].text
      #   net_operating             = info[37].text
      #   operating_expance         = info[39].text
      #   statewide_oepp_rank       = info[43].text
      #   statewide_oepp            = info[41].text
      #   allowance_for_tuition     = info[45].text
      #   per_capita_tuition_charge = info[47].text
      #   statewide_pctc_rank       = info[49].text
      #   statewide_pctc            = info[51].text
      #
      #   sql = "INSERT INTO ilearn_student_info (district_number, district_name, '9-Month Avg. Daily Attendance',
      #       'Statewide ADA', 'Net Operating Expanse', 'Operating Expance Per Pupil (OEPP)',
      #       'Statewide OEPP Rank', 'Statewide OEPP', 'Allowance for Tuition Computation',
      #       'Per Capita Tuition Charge (PCTC)', 'Statewide PCTC Rank', 'Statewide PCTC', data_source_url,
      #       scrape_dev, ilearn_districts_id)
      #
      # VALUES (#{district_number}, '#{district_name}', #{daily_attendance_evg}, #{statewide_ada},
      #         #{net_operating}, #{operating_expance}, #{statewide_oepp_rank}, #{statewide_oepp},
      #         #{allowance_for_tuition}, #{per_capita_tuition_charge}, #{statewide_pctc_rank},
      #         #{statewide_pctc}, '#{data_source_url}', '#{scrape_dev}', #{ilearn_districts_id});"
      #   ActiveRecord::Base.connection.execute(sql)

      end
      agent.get("http://webprod1.isbe.net/ILEARN/Content/SearchData?page=#{page}&amp;RCA=1")
      puts agent.page.uri
    end
  end

  attr_accessor :agent
end
