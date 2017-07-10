require_relative './config/environment'

def reload!
  load_all './lib'
end

task :console do
  Pry.start
end

task :scrape_rooms do

  atx_scraper = RoomScraper.new('https://austin.craigslist.org/search/sha')
  atx_scraper.call

end
