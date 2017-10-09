require_relative '../models/song_attribute_builder'

RSpec.describe SongAttributeBuilder do
  describe '#build' do
    it 'builds the song attributes with the patterns and sound_types' do
      sound_types = %w(kick hitthat snare)
        patterns = %w(xxxx.... ....xxxx x.x.x.x.)
      expected_result = ['kick kick kick kick . . . .', '. . . . hitthat hitthat hitthat hitthat', 'snare . snare . snare . snare .']

      expect(subject.build(sound_types: sound_types, patterns: patterns)).to eq expected_result
    end
  end
end
