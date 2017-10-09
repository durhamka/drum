require_relative '../models/song_attribute_presenter'

RSpec.describe SongAttributePresenter do
  describe '#present' do
    it 'combines all three patterns into one string and pipe delimits it' do
      song_attributes = ['. . . . kick kick kick kick', 'clap clap clap clap . . . .', '. hitthat . hitthat . hitthat . hitthat']
      expected_result = '.|.|.|.|kick|kick|kick|kick|clap|clap|clap|clap|.|.|.|.|.|hitthat|.|hitthat|.|hitthat|.|hitthat'

      expect(subject.present(song_attributes)).to eq expected_result
    end
  end
end
