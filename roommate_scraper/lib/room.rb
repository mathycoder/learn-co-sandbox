class Room 
  attr_accessor :id, :time, :price, :title, :url 
  @@all = []
  
  def initialize(attributes={})
    attributes.each do |key, value|
      self.send("#{key}=",value)
    end 
  end 
  
  def self.all
    sql = %{
      SELECT * FROM rooms
    }
    DB[:conn].execute(sql).map{|row| new_from_db(row)}
  end 
  
  def self.new_from_db(row)
    room = self.new 
    room.id = row[0]
    room.time = row[1]
    room.price = row[2]
    room.title = row[3]
    room.url = row[4] 
    
    room
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