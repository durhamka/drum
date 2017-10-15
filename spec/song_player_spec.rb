require_relative '../models/song_player'

RSpec.describe SongPlayer do
  describe '#play' do
    let(:song) { double(Song, notes: %w(hihat . snare), name: 'Harleigh Song', bpm: 60) }
    let(:mock_song_presenter) { double(SongAttributePresenter) }

    subject { described_class.new(song) }

    describe '#play' do
      it 'prints out each note in the song with a newline' do
        expect { subject.play }.to output("hihat\n.\nsnare\n").to_stdout
      end
    end
  end
end
