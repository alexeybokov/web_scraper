class SqlFormatter
  def self.query_for_ilearn_districts(parser)
    %{
      INSERT INTO ilearn_districts
        (
          district_number,
          district_name,
          superintendent,
          address,
          phone,
          district_type,
          data_source_url,
          scrape_dev
         )

      VALUES
        (
          #{parser.number},
          '#{parser.name}',
          '#{parser.superintendent}',
          '#{parser.address}',
          '#{parser.phone}',
          '#{parser.district_type}',
          '#{parser.data_source_url}',
          '#{parser.scrape_dev}'
        );
    }
  end

  def self.query_for_ilearn_district_id(parser)
    %{SELECT id FROM ilearn_districts WHERE district_number = #{parser.number}}
  end

  def self.query_for_receipts_revenues(parser, ilearn_districts_id)
    %{
      INSERT INTO receipts_revenues (district_number, district_name, state_amount, local_amount,
              federal_amount, total_amount, data_source_url, scrape_dev, ilearn_districts_id)

        VALUES (#{parser.number}, '#{parser.name}', #{parser.state_amount}, #{parser.local_amount}, #{parser.federal_amount},
                #{parser.total_amount}, '#{parser.data_source_url}', '#{parser.scrape_dev}', #{ilearn_districts_id});
    }
  end
end