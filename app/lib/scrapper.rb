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
    (1..last_paginate).each do |page|
      district_links(agent).each do |link|

        parser = Parser.new(link.click)

        puts "Page number: #{page - 1}"
        puts agent.page.uri

        ActiveRecord::Base.connection.execute(SqlFormatter.query_for_ilearn_districts(parser))
        puts "Inserting District: #{parser.name}"
        puts "Inserting data to table 'ilearn_districts': ..................................................."

        ilearn_districts_id = ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_ilearn_district_id(parser)).first[0]

        ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_receipts_revenues(parser, ilearn_districts_id))
        puts "Inserting data to table 'receipts_revenues': .................................................."

        ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_ilearn_student_info(parser, ilearn_districts_id))
        puts "Inserting data to table 'ilearn_student_info': ................................................"

        ActiveRecord::Base.connection
            .execute(SqlFormatter.query_for_ilearn_tax_information(parser))
        puts "Inserting data to table 'ilearn_tax_information': ............................................."

        ActiveRecord::Base.connection
          .execute(SqlFormatter.query_for_ilearn_expenditures_disbursements(parser, ilearn_districts_id))
        puts "Inserting data to table 'ilearn_expenditures_disbursements': .................................."
        end

      agent.get("http://webprod1.isbe.net/ILEARN/Content/SearchData?page=#{page}&amp;RCA=1")
      puts agent.page.uri
    end
  end

  attr_accessor :agent
end
