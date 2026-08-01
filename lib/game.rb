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
      if @round > 13
        break
      end

      # Gameplay loop
      guess = play_round
      puts "#{@human_player.name}: I guess #{guess}!"
      score = @code.score(guess)

      if score[0] == 4
        break
      end

      puts "#{@computer_player.name}: You got #{score[0]} exactly correct, and the correct color for #{score[1]}..."
      symbols = ("●" * score[0]) + ("○" * score[1])
      puts "#{@computer_player.name}: #{symbols}"

      @round += 1
    end

    if @round > 12
      puts "\n"
      puts "----------Game Over: Out of Moves----------"
      puts "Game: #{@human_player.name} has lost the game..."
      puts "Game: #{@computer_player.name} has won!"
      puts "#{@computer_player.name}: My secret code was #{@code.code}... I knew you would never guess it!!!"
      sleep 5
    else
      puts "\n"
      puts "----------Game Over: Round #{@round}----------"
      puts "Game: #{@computer_player.name} has lost the game..."
      puts "Game: #{@human_player.name} has won!"
      puts "#{@computer_player.name}: How did you know... It cant be... I've never lost before... What is this feeling... Nooooooooooo.... (voice fades out dramatically)"
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
