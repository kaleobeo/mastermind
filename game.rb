# frozen_string_literal: true

require_relative 'computer'
require_relative 'player'
require_relative 'display'

# Manages gameflow
class Game
  include Display
  def initialize
    play_game
  end

  private

  def play_game
    choose_roles
    @round = 0
    @codemaker.make_code
    @game_over = false
    play_round until @game_over || @round == 8
    @round == 8 ? display_win(@codemaker) : display_win(@codebreaker)
    reveal_code(@codemaker.computer_code) if @round == 8 && @codebreaker.instance_of?(Player)
    play_again
  end

  def choose_roles
    input = display_choose_roles
    unless %w[1 2].include?(input)
      input_warning
      choose_roles
    end
    if input == '1'
      @codebreaker = Player.new
      @codemaker = Computer.new
    else
      @codebreaker = Computer.new
      @codemaker = Player.new
    end
  end

  def play_round
    @round += 1
    round_number(@round)
    guess = @codebreaker.guess_code
    puts guess.change_to_colors
    feedback = @codemaker.verify_code(guess)
    feedback == { perfect: 4, imperfect: 0 } ? @game_over = true : @codebreaker.handle_feedback(feedback)
  rescue NoMethodError
    puts 'It looks like you made a mistake when giving feedback... Please restart the program.'
    @game_over = true
  end

  def play_again
    input = display_play_again
    unless %w[y n].include?(input)
      input_warning
      play_again
    end
    input == 'y' ? play_game : finish
  end
end