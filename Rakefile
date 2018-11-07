require 'active_record_migrations'
require 'mechanize'
require 'byebug'

APP_ROOT = File.dirname(__FILE__)
Dir[File.join(File.join(APP_ROOT, "/app/lib"), "**/*.rb")].each do |f|
  require f
end

ActiveRecordMigrations.load_tasks
ActiveRecordMigrations.configure do |c|
  c.database_configuration = {
    'development' => { 'adapter' => 'postgresql', 'database' => 'ilearn' },
  }
  # Other settings:
  c.schema_format = :sql # default is :ruby
  c.yaml_config   = 'db/config.yml'
  # c.environment = ENV['db']
  # c.db_dir = 'db'
  c.migrations_paths = ['db/migrate'] # the first entry will be used by the generator
end

desc "web parser"
task :get_data => :environment do
  Scrapper.new.run!
end
