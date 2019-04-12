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
      room = self.new(attributes_hash)
      room.save 
    end 
  end 
  
  def self.create_table 
    sql = %{
      CREATE TABLE IF NOT EXISTS rooms(
        id INTEGER PRIMARY KEY, 
        time TEXT,
        price TEXT, 
        title TEXT,
        url TEXT
        )
    }
    DB[:conn].execute(sql)
  end 
  
  def save 
    sql = %{
      INSERT INTO rooms (time, price, title, url) VALUES 
      (?, ?, ?, ?)
    }
    DB[:conn].execute(sql, self.time, self.price, self.title, self.url)
  
  end 
  
end 