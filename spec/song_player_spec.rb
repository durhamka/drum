require_relative '../models/song_player'

RSpec.describe SongPlayer do
  describe '#play' do
    let(:song) { double(Song, attributes: '', name: 'Harleigh Song', bpm: 112) }
    let(:mock_song_presenter) { double(SongAttributePresenter) }

    before do
      allow(SongAttributePresenter).to receive(:new).and_return mock_song_presenter
      allow(mock_song_presenter).to receive(:present).with(song.attributes).and_return('kick|.|kick|.')
    end

    it 'calls the SongAttributePresenter' do
      subject.play(song)

      expect(mock_song_presenter).to have_received(:present).with(song.attributes)
    end

    it 'returns the playing song dialogue' do
      expect(subject.play(song)).to eq "Now playing Harleigh Song at 112 BPM: kick|.|kick|."
    end
  end
end
