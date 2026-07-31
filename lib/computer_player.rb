# frozen_string_literal: true

class ComputerPlayer
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def make_guess
  end

  def create_code
    new_code = Array.new
    4.times do
      new_code.push( (rand(6)+1).to_s )
    end
    new_code
  end

end
