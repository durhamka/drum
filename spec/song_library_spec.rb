require_relative '../models/song_library'

RSpec.describe SongLibrary do
  describe '#add_song' do
    let(:title) { 'Kinsey Song' }
    let(:bpm) { 123 }
    let(:song_attributes) { 'clap' }

    it 'creates a song with the given attributes' do
      expect(subject.songs.count).to eq 0

      subject.add_song(title, bpm, song_attributes)

      expect(subject.songs.count).to eq 1
    end
  end
end
