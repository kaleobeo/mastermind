# frozen_string_literal: true

# Computer class that manages creating a code and verifying guesses from the player
class Computer

  # Define a function generate_code that makes a 4 digit code such as 1111, 1112, 1122, etc

  def make_code
    @computer_code = []
    4.times { @computer_code.push(rand(1..6)) }
    @computer_code
  end

  def verify_code(guess)
    computer_code = [1, 5, 4, 1]
    computer_feedback = { perfect: 0, imperfect: 0 }
    computer_feedback[:perfect] = check_perfects(computer_code, guess)
    computer_feedback[:imperfect] = check_imperfects(computer_code, guess)
    computer_feedback
  end

  def check_perfects(code, guess)
    perfects = 0
    guess.each_with_index do |digit, pos|
      if code[pos] == digit
        perfects += 1
        code[pos] = 0
      end
    end
    perfects
  end

  def check_imperfects(code, guess)
    imperfects = 0
    guess.each_with_index do |digit, pos|
      if code.include?(digit)
        next if code[pos].zero?

        imperfects += 1
        code[code.index(digit)] = -1
      end
    end
    imperfects
  end
end

test = Computer.new
test.make_code

# checked against code: [1, 5, 4, 1]
code = [1, 5, 4, 1]
puts test.verify_code([1, 5, 4, 3]) == { perfect: 3, imperfect: 0 }
puts test.verify_code([1, 5, 5, 4]) == { perfect: 2, imperfect: 1 }
puts test.verify_code([5, 1, 1, 4]) == { perfect: 0, imperfect: 4 }
puts test.verify_code([1, 5, 4, 1]) == { perfect: 4, imperfect: 0 }
puts test.verify_code([5, 4, 5, 4]) == { perfect: 0, imperfect: 2 }
