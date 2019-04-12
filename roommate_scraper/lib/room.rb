class Room 
  attr_accessor :id, :time, :price, :title, :url 
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
  
  def self.create_table 
    sql = %{
      CREATE TABLE rooms(
        id INTEGER PRIMARY KEY, 
        time TEXT,
        price TEXT, 
        title TEXT,
        url TEXT
        )
    }
    DB[:conn].execute(sql)
  end 
  
end 