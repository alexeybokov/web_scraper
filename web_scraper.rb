module WebScraper
  def regular_helper(value)
    if value.to_s == "$"
      0
    else
      value.text[/(\d+.*)/].delete(',').to_i
    end
  end
end


# require 'active_record_migrations'
# require 'mechanize'
# require 'byebug'
#
#
#
#
#     agent = Mechanize.new
#     agent.get('http://webprod1.isbe.net/ILEARN/')
#     agent.page.forms_with(action: '/ILEARN/Content/SearchData')[0].submit
#     agent.page.uri
#     links_district = agent.page.links_with(href: /(RCDTSeclected)/ )
#
#     # district_infos =[]
#     # district_numbers =[]
#     links_district.each do |link|
#       page = link.click
#       info = page.search('#DistrictInfo')
#       # district_infos << info
#       district_number = info.text[/(\d{5,})/].to_i
#       # district_numbers << district_number
#
#       sql = "INSERT INTO ilearn_districts (district_number)
#       VALUES (#{district_number});" #'#{district_name}', '#{superintendent}', '#{address}',
#       #'#{phone}', '#{district_type}', '#{data_source_url}', '#{scrape_dev}');"
#       ActiveRecord::Base.connection.execute(sql)
#     end
#     # byebug
# #, district_name,
# #    superintendent, address, phone, district_type, data_source_url, scrape_dev)
#
#   # def create_mysql_database
#   #   client = Mysql2::Client.new(host: @host, username: @mysql_user, password: @mysql_pass)
#   #   client.query("CREATE DATABASE #{@database_name} CHARACTER SET utf8 COLLATE utf8_unicode_ci;")
#   #   client.close
#   # end
#
# # def scraper
# #   url = "http://webprod1.isbe.net/ILEARN"
# #   unparsed_page = HTTParty.get(url)
# #   document = Nokogiri::HTML(unparsed_page)
# #
# #   get_table =
# #
# #   # table = document.at('table')
# #   #
# #   # table.search('tr').each do |tr|
# #   # cells = tr.search('th, td')
# #   #   cells.each do |cell|
# #   #     text = cell.text.strip
# #   #   end
# #   # end
# #
# #   #districts_table = Array.new
# #
# #
# #   #data = {
# #   #    id:  '',
# #   #    district_number: '[/(\d{5,})/].to_i',
# #   #    district_name: '[/- .{1,}$/]',
# #   #    superintedent: '[/:.{1,}$/]',
# #   #    addres: '[/:.{1,}$/]',
# #   #    phone: '[/:.{1,}$/]',
# #   #    district_type: '[/:.{1,}$/]',
# #   #    data_sourse_url: "http://webprod1.isbe.net/ILEARN/Content/SearchData" + "",
# #   #    scrape_dev: "Alexey"
# #   #
# #   #}
# #   #districts_table << data
# #
# # end
#
# scraper
