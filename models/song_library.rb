require_relative 'song'

class SongLibrary
  attr_reader :songs

  def initialize
    @songs = []
  end

  def add_song(title, bpm, song_attributes)
    index = 0
    songs.each do |song|
      if title < song.name
        break
      end
      index+= 1
    end

    songs.insert(index, Song.new(title, bpm, song_attributes))
  end
end
