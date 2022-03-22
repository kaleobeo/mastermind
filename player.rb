# frozen_string_literal: true

require_relative 'display'

# Manages input from player
class Player
  attr_accessor :points

  include Display

  def initialize
    @points = 0
  end

  def make_code
    player_make_code
  end

  def verify_code
    feedback = {}
    feedback[:perfect] = Integer(player_verify_perfects, exception: false)
    feedback[:imperfect] = Integer(player_verify_imperfects, exception: false)
    p feedback
    if feedback.any? { |_key, value| value.nil? || !value.between?(0, 4) }
      input_warning
      verify_code
    end
    feedback
  end

  # Define method guess_code which prompts for a code from the player and returns it
  def guess_code
    input = player_select_code.chars.map(&:to_i)
    return input if input.all? { |elem| elem.between?(1, 6) } && input.length == 4

    input_warning
    guess_code
  end
end

