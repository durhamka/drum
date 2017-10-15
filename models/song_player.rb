require_relative 'song'
require 'rainbow'

class SongPlayer
  SECONDS = 60.0

  def initialize(song)
    @song = song
  end

  def play
    song_notes.each do |note|
      print Rainbow(note + "\n").bright.mediumpurple
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
