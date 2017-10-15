require_relative '../models/song_library'
require_relative '../models/song_player'
require_relative '../models/song_note_builder'

class MenuController
  def initialize
    @song_library = SongLibrary.new
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
      puts 'Goodbye! Thanks for making music.'
      exit(0)
    else
      system 'clear'
      puts 'Sorry, that is not a valid input'
      main_menu
    end
  end

  private
  attr_reader :song_library

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

    prompts('first', sound_types, patterns)
    prompts('second', sound_types, patterns)
    prompts('third', sound_types, patterns)

    notes = SongNoteBuilder.new.build(patterns: patterns, sound_types: sound_types)
    song_library.add_song(title, bpm, notes)

    system 'clear'
    puts 'New song created!'
  end

  def prompts(number, sound_types, patterns)
    print_type_of_sound_prompt(number)
    add_notes(sound_types)
    print_pattern_prompt(number)
    add_notes(patterns)
  end

  def print_type_of_sound_prompt(number)
    print "Enter the #{number} type of sound. Please use: kick, clap, hihat, or snare): "
  end

  def print_pattern_prompt(number)
    print "Input your #{number} pattern. Needs to be in 4/4 time with 8 steps. Use . for empty steps. (Example: .x..xx.x): "
  end

  def add_notes(attribute_array)
    attribute_array.push(gets.chomp)
  end

  def play_last_song
    if song_library.songs.length > 0
      song = song_library.songs.last
      puts "Now playing #{song.name} at #{song.bpm} BPM"
      SongPlayer.new(song).play
    else
      puts 'You have no songs to play.'
    end
  end
end
