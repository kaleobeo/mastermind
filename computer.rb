# frozen_string_literal: true

# Computer class that manages creating a code and verifying guesses from the player
class Computer
  attr_reader :computer_code
  attr_accessor :points

  @@permutations = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a

  def initialize
    @possible_solutions = @@permutations.dup
    @points = 0
  end
  # Define a function generate_code that makes a 4 digit code such as 1111, 1112, 1122, etc

  def make_code
    @computer_code = []
    4.times { @computer_code.push(rand(1..6)) }
    @computer_code
  end

  def handle_feedback(feedback)
    @possible_solutions.filter! { |solution| verify_code(solution, @last_guess) == feedback }
    puts @possible_solutions.length
  end

  def guess_code
    @last_guess = @possible_solutions.length == 1296 ? [1, 1, 2, 2] : find_best_guess
    @last_guess
  end

  def verify_code(guess, solution = @computer_code)
    code = solution.dup
    guess = guess.dup
    computer_feedback = { perfect: 0, imperfect: 0 }
    computer_feedback[:perfect] = check_perfects(code, guess)
    computer_feedback[:imperfect] = check_imperfects(code, guess)
    computer_feedback
  end

  private

  def find_best_guess
    guess_quality = {}
    @possible_solutions.each do |guess|
      guess_scores = Hash.new(0)
      @possible_solutions.each do |code|
        guess_scores[verify_code(guess, code)] += 1
      end
      guess_quality[guess] = guess_scores.max_by { |_k, v| v }[1]
    end
    guess_quality.min_by { |_k, v| v }[0]
  end

  def check_perfects(guess, code)
    perfects = 0
    guess.each_with_index do |digit, pos|
      if code[pos] == digit
        perfects += 1
        code[pos] = 0
      end
    end
    perfects
  end

  def check_imperfects(guess, code)
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




#test = Computer.new
#test.make_code
#p test.computer_code
#p test.computer_code
#puts test.verify_code([1, 1, 2, 2])

# checked against code: [1, 5, 4, 1]
#code = [1, 5, 4, 1]
#puts test.verify_code([1, 5, 4, 3], code) == { perfect: 3, imperfect: 0 }
#puts test.verify_code([1, 5, 5, 4], code) == { perfect: 2, imperfect: 1 }
#puts test.verify_code([5, 1, 1, 4], code) == { perfect: 0, imperfect: 4 }
#puts test.verify_code([1, 5, 4, 1], code) == { perfect: 4, imperfect: 0 }
#puts test.verify_code([5, 4, 5, 4], code) == { perfect: 0, imperfect: 2 }
