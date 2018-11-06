class Parser
  def initialize(district_page)
    @district_page = district_page
  end

  def number
    format_value(base_info.text[/(\d{5,})/].to_i)
  end

  def name
    format_value(base_info.text[/- .{1,}$/].delete_prefix('- '))
  end

  def superintendent
    format_value additional_info(0)
  end

  def address
    format_value additional_info(1)
  end

  def phone
    format_value additional_info(2)
  end

  def district_type
    format_value additional_info(3)
  end

  def data_source_url
    format_value district_page.uri
  end

  def scrape_dev
    format_value('alexey')
  end

  def state_amount
    format_value receipts_info(1)
  end
  
  def local_amount
    format_value receipts_info(5)
  end
  
  def federal_amount
    format_value receipts_info(9)
  end
  
  def total_amount
    format_value receipts_info(13)
  end

  private
  
  def receipts_info(index)
    district_page.search('td')[index].text[/(\d+.*)/]&.delete(',')&.to_i
  end

  def format_value(value)
    if value.nil?
      'NULL'
    elsif value.is_a?(String)
      value.strip
    else
      value
    end
  end

  def base_info
    @base_info ||= district_page.search('#DistrictInfo')
  end

  def additional_info(index)
    district_page.search('.col-md-offset-4 p')[index].text[/:.{1,}$/].delete_prefix(': ')
  end

  attr_reader :district_page
end