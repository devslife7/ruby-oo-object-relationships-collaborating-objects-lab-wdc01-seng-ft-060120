require 'pry'
class Artist

    attr_accessor :name

    @@all = []
    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
        @@all
    end

    def songs
        var = Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        # Find the artist instance that has that name
        artist = self.all.select {|artist| artist.name == name}

        (artist[0] == nil)? self.new(name) : artist[0]

    #     if artist[0] == nil
    #         self.new(name)
    #     else
    #         artist[0]
    #     end
    end

    def print_songs
        # Why isn't binding.pry working within this method?
        Song.all.each do |song|
            if song.artist == self
                puts song.name
            end
        end
    end
end