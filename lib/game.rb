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
  def initialize(cpu_name, human_name)
    @round = 0
    @score = 0
    @human_player = HumanPlayer.new(human_name)
    @computer_player = ComputerPlayer.new(cpu_name)
  end



end
