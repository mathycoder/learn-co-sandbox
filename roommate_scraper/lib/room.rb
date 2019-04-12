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
      self.scrape_rooms
    end 
    @@all 
  end 
  
  def scrape_rooms 
  end 
  
end 