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

    # Define method guess_code which prompts for a code from the player and returns it
  def guess_code
    input = player_select_code.chars.map(&:to_i)
    return input if input.all? { |elem| elem.between?(1, 6) } && input.length == 4

    input_warning
    guess_code
  end

  def handle_feedback(feedback)
    puts(feedback.hash_to_hints)
  end

  def verify_code(guess)
    perfects = Integer(player_verify_perfects, exception: false)
    imperfects = Integer(player_verify_imperfects, exception: false)
    verification_error if [perfects, imperfects].any? { |elem| elem.nil? || !elem.between?(0, 4) }
    verification_error if perfects + imperfects > 4
    { perfect: perfects, imperfect: imperfects }
  end

  private

  def verification_error
    input_warning
    verify_code
  end
end

