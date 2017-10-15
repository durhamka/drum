class Song
  attr_accessor :name, :bpm, :notes

  def initialize(name, bpm, notes)
    @name = name
    @bpm = bpm
    @notes = notes
  end
end
