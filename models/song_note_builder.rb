class SongNoteBuilder
  def build(sound_types:, patterns:)
    beat = sound_types.zip(patterns).map do |sound_type, pattern|
      chars = pattern.split('')
      chars.map { |char| char.gsub('x', "#{sound_type}") }
    end

    beat[0].zip(beat[1], beat[2]).flatten
  end
end
