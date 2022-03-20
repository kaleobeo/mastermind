# frozen_string_literal: true

# Computer class that manages creating a code and verifying guesses from the player
class Computer

  # Define a function generate_code that makes a 4 digit code such as 1111, 1112, 1122, etc

  def make_code
    @computer_code = []
    4.times { @computer_code.push(rand(1..6)) }
    @computer_code
  end

  # Define a function verify_code that checks each digit of a given code against another code, and returns the quality

  # def verify_code(array)
  #   computer_code = [1, 2, 3, 3]
  #   computer_feedback = { perfect: 0, included: 0 }
  #   array.each_with_index do |digit, position|
  #     if computer_code[position] == digit
  #       computer_feedback[:perfect] += 1
  #       computer_code[computer_code.index(digit)] = nil
  #     elsif computer_code.include?(digit)
  #       computer_feedback[:included] += 1
  #       computer_code[computer_code.index(digit)] = nil
  #     end
  #   end
  #   computer_feedback
  # end

  def verify_code(guess)
    computer_code = @computer_code.dup
    computer_feedback = { perfect: 0, imperfect: 0 }
    guess.each_with_index do |digit, pos|
      if computer_code[pos] == digit
        computer_feedback[:perfect] += 1
        computer_code[pos] = 0
      end
    end
    guess.each do |digit|
      if computer_code.include?(digit)
        computer_feedback[:imperfect] += 1
        computer_code[computer_code.index(digit)] = 0
      end
    end
    computer_feedback
  end
end

test = Computer.new
test.make_code
p test.verify_code([1, 1, 2, 2])
