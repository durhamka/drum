require_relative '../models/song_library'
require_relative '../models/song_player'
require_relative '../models/song_builder'

class MenuController
  attr_reader :song_library, :song_player, :song_builder

  def initialize
    @song_library = SongLibrary.new
    @song_player = SongPlayer.new
    @song_builder = SongBuilder.new
  end

  def main_menu
    puts "Main Menu - Songs in song library: #{song_library.songs.map(&:name).join('')}"
    puts '1 - View songs'
    puts '2 - Create a song'
    puts '3 - Play song'
    puts '4 - Exit'
    print 'Enter your selection: '

    selection = gets.to_i

    case selection
    when 1
      system 'clear'
      view_songs
      main_menu
    when 2
      system 'clear'
      create_song
      main_menu
    when 3
      system 'clear'
      play_last_song
      main_menu
    when 4
      puts 'Good-bye!'
      exit(0)
    else
      system 'clear'
      puts 'Sorry, that is not a valid input'
      main_menu
    end
  end

  private

  def view_songs
    if song_library.songs.length > 0
      puts 'Created Songs:'
      song_library.songs.map do |song|
        system 'clear'
        puts "Song name: #{song.name}, Song BPM: #{song.bpm}"
      end
    else
      system 'clear'
      puts 'There are no songs to view...'
    end
  end

  def create_song
    system 'clear'
    patterns = []
    sound_types = []
    puts 'New Song'
    print 'Name: '
    title = gets.chomp
    print 'BPM (beats per minute): '
    bpm = gets.chomp
    print_type_of_sound_prompt('first')
    add_attribute(sound_types)
    print_pattern_prompt('first')
    add_attribute(patterns)
    print_type_of_sound_prompt('second')
    add_attribute(sound_types)
    print_pattern_prompt('second')
    add_attribute(patterns)
    print_type_of_sound_prompt('third')
    add_attribute(sound_types)
    print_pattern_prompt('third')
    add_attribute(patterns)

    song_attributes = song_builder.build(patterns: patterns, sound_types: sound_types)
    song_library.add_song(title, bpm, song_attributes)

    system 'clear'
    puts 'New song created!'
  end

  def print_type_of_sound_prompt(number)
    print "Enter the #{number} type of sound (eg. kick, clap): "
  end

  def print_pattern_prompt(number)
    print "Input your #{number} pattern. Needs to be in 4/4 time with 8 steps. Use . for empty steps. (eg. .x..xx.x): "
  end

  def add_attribute(attribute_array)
    attribute_array.push(gets.chomp)
  end

  def play_last_song
    if song_library.songs.length > 0
      puts @song_player.play(song_library.songs.last)
    else
      puts 'You have no songs to play.'
    end
  end
end
