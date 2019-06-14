=begin
  Genre
  #name
    has a name (FAILED - 8)
  #songs
    has many songs (FAILED - 9)
  .all
    knows about all genre instances (FAILED - 10)
  #artists
    has many artists, through songs (FAILED - 11)
=end

class Genre 
    attr_accessor :name
    @@all = []
  
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
      Song.all.select {|song| song.genre == self}
    end
    
    def artists
      Song.all.map {|song| song.artist}
    end

    def self.all
        @@all
    end

end