
class Song

    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)        
        artist = Artist.all.select do |artist|
            artist.name == name
        end

        if artist.length == 0
            new_artist = Artist.new(name)
            self.artist = new_artist
        else
            self.artist = artist[0]
        end
    end

    def self.new_by_filename(song_file)
        # handle the creation of Song instances and their associated Artist instances
        song_info = song_file.split(" - ")
        song = Song.new(song_info[1])
        artist = Artist.new(song_info[0])
        song.artist = artist
        song
    end
end