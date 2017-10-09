class SongAttributePresenter
  def present(song_attributes)
    song_attributes.join(' ').gsub(' ', '|')
  end
end
