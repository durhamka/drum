class Song
  attr_accessor :name, :bpm, :attributes

  def initialize(name, bpm, attributes)
    @name = name
    @bpm = bpm
    @attributes = attributes
  end
end
