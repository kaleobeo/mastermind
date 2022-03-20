# frozen_string_literal: true


module Display
  def welcome
    puts 'Welcome to Mastermind!'
  end

  def player_select_code
    puts 'Player, please select a code of 4 digits 1-6, such as 1234, 1122, 6666 for the AI to guess.'
    gets.chomp
  end

  def player_get_guess
    puts 'What code do you want to guess next?'
    gets.chomp
  end
end

class String
  def colorize(color_code)
    "\u001b[#{color_code}m#{self}\u001b[0m"
  end

  def red
    colorize(41)
  end

  def green
    colorize(42)
  end

  def yellow
    colorize(43)
  end

  def blue
    colorize(44)
  end

  def magenta
    colorize(45)
  end

  def cyan
    colorize(46)
  end
end