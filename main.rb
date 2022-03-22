# frozen_string_literal: true

require_relative 'game'
require_relative 'display'

# Code run at beginning of execution
class Main
  extend Display
  def self.start_game
    welcome
    Game.new
  end
end

Main.start_game