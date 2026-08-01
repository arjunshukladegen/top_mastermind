# frozen_string_literal: true

class Code
  attr_writer :code
  attr_reader :code
  def initialize(code)
    @code = code
  end

  def score(guess)
    exact_guesses = 0
    partial_guesses = 0

    code_copy = @code.dup

    deleted = 0
    guess.size.times do |i|
      idx = i - deleted
      if guess[idx] == code_copy[idx]
        exact_guesses += 1
        code_copy.delete_at(idx)
        guess.delete_at(idx)
        deleted += 1
      end
    end

    guess.size.times do |i|
      if code_copy.include?(guess[i])
        partial_guesses += 1
        code_copy.delete_at(code_copy.index(guess[i]))
      end
    end

    return [exact_guesses, partial_guesses]
  end

end
