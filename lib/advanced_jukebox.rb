#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer
=begin
 my_songs = {
 "Go Go GO" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/01.mp3',
 "LiberTeens" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  '< path to this directory >/jukebox-cli/audio/Emerald-Park/03.mp3',
 "Guiding Light" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/04.mp3',
 "Wolf" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/05.mp3',
 "Blue" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/07.mp3'
 }
=end

def help
  #this method should be the same as in jukebox.rb
puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
end
#help


def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  counter = 1
  my_songs.keys.collect do |x|
    puts counter.to_s + ". " + x
    counter = counter + 1
  end
end
list(my_songs)

def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
puts "Please enter a song name or number:"
song_name = gets.chomp
default = "Invalid input, please try again"
  my_songs.keys.each do |x|
    if song_name == x
      default = "Playing " + x
    system "'open <#{my_songs[x]}>'"
    end
  end
  puts default
end
#play(my_songs)


def exit_jukebox
  #this method is the same as in jukebox.rb
  puts "Goodbye"
end

def run(my_songs)
  #this method is the same as in jukebox.rb
  help
  puts "Please enter a command:"
  command = gets.chomp
  loop do
    if command == "exit"
      exit_jukebox
      break
    elsif command == "list"
      list(my_songs)
      puts "Please enter a command:"
      command = gets.chomp
    elsif command == "play"
      play(my_songs)
      puts "Please enter a command:"
      command = gets.chomp
    elsif command == "help"
      help
      puts "Please enter a command:"
      command = gets.chomp
    end
  end
end
#run(my_songs)
