class Room 
  attr_accessor :time, :price, :title 
  @@all = []
  
  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=",value)
    end 
    @@all << self 
  end 
  
  def self.all
    if @@all == [] 
      scrape_rooms
    end 
    @@all 
  end 
  
  def self.scrape_rooms 
    RoomScraper.new.scrape.each do |attributes_hash|
      self.new(attributes_hash)
    end 
  end 
  
end 