require 'open-uri'

class RoomScraper 
  attr_accessor :path, :doc  
  
  def initialize(path="https://newyork.craigslist.org/search/roo")
    @path = path 
    html = open(@path)
    @doc = Nokogiri::HTML(html)
  end 
  
  def scrape 
    # time = doc.css(".result-row")[0].css("time").text
    # price = doc.css(".result-row")[0].css("a span")[0].text
    # title = doc.css(".result-row")[0].css("a.result-title.hdrlnk").text
    
    doc.css(".result-row").each do |listing|
    time = listing.css("time").text
    price = listing.css("a span")[0].text
    title = listing.css("a.result-title.hdrlnk").text
    binding.pry 
    end 
    
    
  end 
  
  
  def update_rooms 
    puts "hi!"
  end 
  
end 