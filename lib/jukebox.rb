require 'pry'

=begin
songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]
=end

def help
  #this method should be the same as in jukebox.rb
puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
end

def list(songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  counter = 1
  songs.collect do |x|
    puts counter.to_s + ". " + x
    counter = counter + 1
  end
end
#list(songs)

def play(songs)
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
  songs.each do |x|
    if song_name == x
      default = "Playing " + x
    elsif song_name == "1"
      default = "Playing" + songs[x.to_i]
    #system "'open <#{songs[x]}>'"
    end
  end
  puts default
end
#play(my_songs)
#play([])


def exit_jukebox
  #this method is the same as in jukebox.rb
  puts "Goodbye"
end

def run(songs)
  #this method is the same as in jukebox.rb
  help
  puts "Please enter a command:"
  command = gets.chomp
  loop do
    if command == "exit"
      exit_jukebox
      break
    elsif command == "list"
      list(songs)
      puts "Please enter a command:"
      command = gets.chomp
    elsif command == "play"
      play(songs)
      puts "Please enter a command:"
      command = gets.chomp
    elsif command == "help"
      help
      puts "Please enter a command:"
      command = gets.chomp
    end
  end
end
