require_relative '../models/song_note_builder'

RSpec.describe SongNoteBuilder do
  describe '#build' do
    it 'builds the song notes with the patterns and sound_types' do
      sound_types = %w(kick hitthat snare)
      patterns = %w(xxxx.... ....xxxx x.x.x.x.)

      expected_result = %w(kick . snare kick . . kick . snare kick . . . hitthat snare . hitthat . . hitthat snare . hitthat .)
      expect(subject.build(sound_types: sound_types, patterns: patterns)).to eq expected_result
    end
  end
end
