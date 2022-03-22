# frozen_string_literal: true

require_relative 'game'
require_relative 'display'

# Code run at beginning of execution
class Main
  include Display
  def self.start_game
    welcome
    Game.new
  end
end