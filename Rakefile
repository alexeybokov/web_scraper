require 'active_record_migrations'
require_relative 'web_scraper.rb'
require 'mechanize'
require 'byebug'

include WebScraper


ActiveRecordMigrations.load_tasks
ActiveRecordMigrations.configure do |c|
  c.database_configuration = {
    'development' => {'adapter' => 'postgresql', 'database' => 'ilearn'},
  }
  # Other settings:
  c.schema_format = :sql # default is :ruby
  c.yaml_config = 'db/config.yml'
  # c.environment = ENV['db']
  # c.db_dir = 'db'
  c.migrations_paths = ['db/migrate'] # the first entry will be used by the generator
  end

  desc "web parser"
  task :web_parser => :environment do
    agent = Mechanize.new
    agent.get('http://webprod1.isbe.net/ILEARN/')
    agent.page.forms_with(action: '/ILEARN/Content/SearchData')[0].submit
    agent.page.uri


    # def regular_helper(value)
    #   return 0 if value.text.eql?('')
    #   value.text[/(\d+.*)/].delete(',').to_i
    # end

    links_district = agent.page.links_with(href: /(RCDTSeclected)/ )
    # page = 1
    # per_page = links_district.count
    last_page = agent.page.search('.col-md-offset-4').text[/(\d+)(\d+)/].delete_suffix('12345678910').to_i

    (69..71).each do |page|
      agent.page.links_with(href: /(RCDTSeclected)/).each do |link|

        district_link = link.click

        district_info = district_link.search('#DistrictInfo')
        district_number = district_info.text[/(\d{5,})/].to_i
        district_name = district_info.text[/- .{1,}$/].delete_prefix('- ')

        info = district_link.search('.col-md-offset-4 p')
        superintendent = info[0].text[/:.{1,}$/].delete_prefix(': ')
        address = info[1].text[/:.{1,}$/].delete_prefix(': ')
        phone = info[2].text[/:.{1,}$/].delete_prefix(': ')
        district_type = info[3].text[/:.{1,}$/].delete_prefix(': ')
        data_source_url = district_link.uri
        scrape_dev = 'alexey'

        puts "Page number: #{page}"
        puts agent.page.uri

        sql = "INSERT INTO ilearn_districts (district_number, district_name,
               superintendent, address, phone, district_type, data_source_url, scrape_dev)

        VALUES (#{district_number}, '#{district_name}', '#{superintendent}',
               '#{address}', '#{phone}', '#{district_type}', '#{data_source_url}', '#{scrape_dev}');"

        ActiveRecord::Base.connection.execute(sql)
        puts "Inserting District: #{district_name}"

        district_info = district_link.search('td')

        state_amount = regular_helper(district_info[1])
        local_amount = district_info[5].text[/(\d+.*)/].delete(',').to_i
        federal_amount = district_info[9].text[/(\d+.*)/].delete(',').to_i #TODO fix reg exp
        total_amount = district_info[13].text[/(\d+.*)/].delete(',').to_i

        sql = "SELECT id FROM ilearn_districts WHERE district_number = #{district_number}"
        ilearn_districts_id = ActiveRecord::Base.connection.execute(sql)[0]['id']

        sql = "INSERT INTO receipts_revenues (district_number, district_name, state_amount, local_amount,
              federal_amount, total_amount, data_source_url, scrape_dev, ilearn_districts_id)

        VALUES (#{district_number}, '#{district_name}', #{state_amount}, #{local_amount}, #{federal_amount},
                #{total_amount}, '#{data_source_url}', '#{scrape_dev}', #{ilearn_districts_id});"

        ActiveRecord::Base.connection.execute(sql)
        puts "Inserting Data to table receipts_revenues: ...................................................."
      end
      agent.get("http://webprod1.isbe.net/ILEARN/Content/SearchData?page=#{page}&amp;RCA=1")
      puts agent.page.uri
    end
  end
