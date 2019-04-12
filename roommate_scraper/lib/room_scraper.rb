require 'open-uri'

class RoomScraper 
  attr_accessor :path, :doc  
  
  def initialize(path="https://newyork.craigslist.org/search/roo")
    @path = path 
    html = open(@path)
    @doc = Nokogiri::HTML(html)
  end 
  
  def scrape 
    listings = [] 
    doc.css(".result-row").each do |listing|
      listings << {
      :time => listing.css("time").text,
      :price => listing.css("a span")[0].text,
      :title => listing.css("a.result-title.hdrlnk").text,
      :url => listing.css("a").attribute("href").value
      }
    end 
    listings 
  end 
  
  
  def update_rooms 
    puts "hi!"
  end 
  
end 