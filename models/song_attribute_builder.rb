class SongAttributeBuilder
  def build(sound_types:, patterns:)
    sound_types.zip(patterns).map do |sound_type, pattern|
      chars = pattern.split('')
      chars.map { |char| char.gsub('x', "#{sound_type}") }.join(' ')
    end
  end
end
