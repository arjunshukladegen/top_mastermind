# frozen_string_literal: true

class Code
  attr_writer :code
  attr_reader :code
  def initialize(code)
    @code = code
  end
end
