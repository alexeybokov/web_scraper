require 'active_record_migrations'

ActiveRecordMigrations.load_tasks

ActiveRecordMigrations.configure do |c|
  c.database_configuration = {
    'development' => {'adapter' => 'mysql2', 'database' => 'ilearn'},
  }
  # Other settings:
  c.schema_format = :sql # default is :ruby
  c.yaml_config = 'db/config.yml'
  # c.environment = ENV['db']
  # c.db_dir = 'db'
  c.migrations_paths = ['db/migrate'] # the first entry will be used by the generator
  end

sql = "INSERT INTO ilearn_districts (district_number, district_name, superintendent, address, phone, district_type, data_source_url, scrape_dev) VALUES (#{district_number}, '#{district_name}', '#{superintendent}', '#{address}', '#{phone}', '#{district_type}', '#{data_source_url}', '#{scrape_dev}');"