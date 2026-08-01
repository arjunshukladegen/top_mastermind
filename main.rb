# frozen_string_literal: true

# Mastermind
%w[lib/code lib/computer_player lib/human_player lib/game].each { |f| require_relative f }

def random_name
  names = ["Pee Diddy", "Sherlock Homeless", "Light Dawgami", "Armin Ackerman", "Gotham Chess"]
  return names[rand(5)]
end

def get_name
  loop do
    puts "\n"
    puts '----------Choose Your Name----------'
    print "Game: What is your name?: "
    input = gets.chomp
    loop do
      puts "\n"
      puts '----------Please Confirm----------'
      puts "Game: Is your name '#{input}' ?"
      print "Game: reply 'yes' to start, or 'no' to pick a different name: "
      confirmation = gets.chomp.downcase
      case confirmation
      when "yes"
        return input
      when "no"
        break
      else
        nil
      end
    end
  end
end





loop do
  puts "\n"
  puts '----------Mastermind----------'
  puts "Game: Welcome to mastermind!"
  print "Game: type 'yes' to start game, or 'no' to quit: "
  input = gets.chomp.downcase
  case input
  when 'yes'
    human_name = get_name
    cpu_name = random_name
    Game.new(human_name, cpu_name).start
    puts "Game: Mastermind is now restarting!"
    sleep 3
  when 'no'
    break
  else
    nil
  end
end