require_relative 'song'
require_relative 'song_attribute_presenter'

class SongPlayer
  def play(song)
    presented_song_attributes = SongAttributePresenter.new.present(song.attributes)
    "Now playing #{song.name} at #{song.bpm} BPM: #{presented_song_attributes}"
  end
end
