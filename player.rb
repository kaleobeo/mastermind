# frozen_string_literal: true

require_relative 'display'
# Manages input from player
class Player
  include Display
  # Define method get_code which prompts for a code from the player and returns it
  def make_code
    player_select_code
  end
end