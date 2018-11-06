require 'nokogiri'
require 'httparty'
require 'byebug'
require 'mysql2'



def create_mysql_database
  client = Mysql2::Client.new(host: @host, username: @mysql_user, password: @mysql_pass)
  client.query("CREATE DATABASE #{@database_name} CHARACTER SET utf8 COLLATE utf8_unicode_ci;")
  client.close
end

def scraper
  url = "http://webprod1.isbe.net/ILEARN/Content/SearchData"
  unparsed_page = HTTParty.get(url)
  document = Nokogiri::HTML(unparsed_page)
  table = document.at('table')

  table.search('tr').each do |tr|
  cells = tr.search('th, td')
    cells.each do |cell|
      text = cell.text.strip
    end
  end

  #districts_table = Array.new
  byebug

  #data = {
  #    id:  '',
  #    district_number: '[/(\d{5,})/].to_i',
  #    district_name: '[/- .{1,}$/]',
  #    superintedent: '[/:.{1,}$/]',
  #    addres: '[/:.{1,}$/]',
  #    phone: '[/:.{1,}$/]',
  #    district_type: '[/:.{1,}$/]',
  #    data_sourse_url: "http://webprod1.isbe.net/ILEARN/Content/SearchData" + "",
  #    scrape_dev: "Alexey"
  #
  #}
  #districts_table << data

end

scraper