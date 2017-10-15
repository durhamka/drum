require_relative 'song'

class SongPlayer
  SECONDS = 60.0

  def initialize(song)
    @song = song
  end

  def play
    song_notes.each do |note|
      print note + "\n"
      sleep time_between_notes
    end
  end

  private
  attr_reader :song

  def time_between_notes
    (SECONDS / song.bpm.to_f) / 2
  end

  def song_notes
    song.notes
  end
end
