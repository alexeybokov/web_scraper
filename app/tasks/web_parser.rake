desc "web parser"
task :get_data => :environment do
  Scrapper.new.run!
end
