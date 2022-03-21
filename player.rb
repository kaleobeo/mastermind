# frozen_string_literal: true

require_relative 'display'

# Manages input from player
class Player
  attr_accessor :points

  include Display

  def initialize
    @points = 0
  end

  # Define method guess_code which prompts for a code from the player and returns it
  def guess_code
    input = player_select_code.chars.map(&:to_i)
    return input if input.all? { |elem| elem.between?(1, 6) } && input.length == 4

    input_warning
    guess_code
  end
end

