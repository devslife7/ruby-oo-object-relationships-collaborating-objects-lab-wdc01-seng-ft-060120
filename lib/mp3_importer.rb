require 'pry'
class MP3Importer
    
    attr_accessor :path
    
    # @@all = []

    def initialize(path)
      @path = path
    #   @@all << self
    end

    def files
        file_list = Dir.entries(@path)

        file_list.select do |file|
            file.chars.last(4).join == ".mp3"
        end
        # file_list.collect do |file|
        #     file.split('.')[0]
        # end
    end

    def import
        files.each do |song_file|
            Song.new_by_filename(song_file)
        end
    end
end