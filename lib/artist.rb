=begin
Artist
  #name
    has a name
  .all
    knows about all artist instances
  #new_song
    given a name and genre, creates a new song associated with that artist (FAILED - 1)
  #songs
    has many songs (FAILED - 2)
  #genres
    has many genres, through songs (FAILED - 3)
=end
require 'pry'

class Artist 
    attr_accessor :name, :genre
    @@all = []
    
    def initialize(name)
     @name = name
     @@all << self
    end
    # binding.pry
    
    def songs
      Song.all.select {|song| song.artist == self} # .select returns a new array caontaining all elements
    end
    
    def genres
      Song.all.map {|song| song.genre}
    end
    
    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def self.all
      @@all
    end
  end