def song_player
  ARGV.each do |arg|
    puts "Hello, #{arg}!"
  end
  puts "Hello, World!"
end

song_player
