# frozen_string_literal: true

# Methods to communicate with the player
module Display
  def welcome
    puts 'Welcome to Mastermind! Try to beat the computer in 8 rounds or less!'
  end

  def finish
    puts 'Thanks for playing!'
  end

  def display_win(winner)
    puts "#{winner.class} wins!"
  end

  def display_choose_roles
    puts 'Enter \'1\' if you want to play as the Codebreaker, \'2\' if you want to be codemaker.'
    gets.chomp
  end

  def display_play_again
    puts 'Would you like to play again? Type \'y\' if so, \'n\' if not.'
    gets.chomp
  end

  def player_select_code
    puts 'Player, please select a code of 4 digits 1-6, such as 1234, 1122, 6666 to guess.'
    gets.chomp
  end

  def player_make_code
    puts 'Please think of a code, and make note of it. If you give poor feedback, the AI might not be able to guess.'
    sleep 1.5
  end

  def player_verify_perfects
    puts 'How many pegs are in the perfect position?'
    gets.chomp
  end

  def player_verify_imperfects
    puts 'How many pegs are in your code, but placed in the wrong position?'
    gets.chomp
  end

  def round_number(num)
    puts "Round #{num}, GO!"
  end

  def reveal_code(code)
    puts "Looks like the robots won... The code was: #{code.join}"
  end

  def input_warning
    puts 'Sorry, that is not a valid number'
  end
end

# Add colorizing methods to string class
class String
  def colorize(color_code)
    "\u001b[#{color_code}m#{self}\u001b[0m"
  end

  def red
    colorize(41)
  end

  def yellow
    colorize(43)
  end

  def green
    colorize(42)
  end

  def blue
    colorize(44)
  end

  def cyan
    colorize(46)
  end

  def magenta
    colorize(45)
  end
end

# Method to turn an array into a colored string
class Array
  def change_to_colors
    output = self.map do |num|
      "  #{num}  ".to_s.colorize(num + 40)
    end
    output.join(' ')
  end
end

# Add method to turn a hints hash into usable text
class Hash
  def hash_to_hints
    puts "Perfect: #{self[:perfect]}, Imperfect: #{self[:imperfect]}, Wrong: #{4 - self[:perfect] - self[:imperfect]}"
  end
end