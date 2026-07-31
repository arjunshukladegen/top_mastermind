# frozen_string_literal: true

class Game
  COLOR_MAP = {
    1 => "red",
    2 => "blue",
    3 => "yellow",
    4 => "green",
    5 => "orange",
    6 => "pink"
  }
  def initialize(human_name, cpu_name)
    @round = 1
    @score = 0
    @human_player = HumanPlayer.new(human_name)
    @computer_player = ComputerPlayer.new(cpu_name)
  end

  def start
    puts "\n"
    puts '----------Game Starting----------'
    puts "Game: Mastermind has started!"
    puts "Player: #{@human_player.name}"
    puts "Vs"
    puts "CPU: #{@computer_player.name}"

    puts "\n"

    puts "----------#{@computer_player.name}----------"
    @code = Code.new(@computer_player.create_code)
    puts "#{@computer_player.name}: I have picked a secret code: 4 pegs, colors numbered 1-6."
    puts "#{@computer_player.name}: Repeats are allowed. You have 12 guesses."
    puts "#{@computer_player.name}: You'll never guess it! Muahahahaha!!!"

    puts "\n"

    puts "----------Gameplay Tips----------"
    puts "Game: You will use digits to represent colors"
    COLOR_MAP.each do |key, value|
      print "# #{key} = #{value}\n"
    end
    puts "Game: The following symbols will be used to represent feedback."
    puts "Game: ● = Right Color & Right Spot"
    puts "Game: ○ = Right Color & Wrong Spot"

    loop do
      # Gameplay loop
      guess = play_round
      puts "#{@human_player.name}: I guess #{guess}!"
      puts "#{@computer_player.name}: My code is #{@code.code}"
    end

  end

  def play_round
    loop do
      puts "\n"
      puts "----------Mastermind Round #{@round} / 12----------"
      print "Game: Make your guess: "
      input = gets.chomp
      if input.length == 4 && input.to_i.is_a?(Integer)
        return input.split("")
      else
        puts "Game: Error, invalid guess. Please try again."
      end
    end
  end


end
