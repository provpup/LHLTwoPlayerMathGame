# Class for math questions and can verify answers to that question
class MathQuestion
  
  attr_reader :question_text

  def initialize(player_name, first_operand, operation_text, second_operand)
    @first_op = first_operand
    @second_op = second_operand
    @question_text = "#{player_name}, what does #{@first_op} #{operation_text} #{@second_op} equal? "
  end

  def verify_answer?(answer)
    false
  end
end

# Addition question
class AdditionQuestion < MathQuestion

  def initialize(player_name, first_operand, second_operand)
    super(player_name, first_operand, 'plus', second_operand)
  end

  def verify_answer?(answer)
    @first_op + @second_op == answer
  end
end

# Subtraction question
class SubtractionQuestion < MathQuestion

  def initialize(player_name, first_operand, second_operand)
    super(player_name, first_operand, 'minus', second_operand)
  end

  def verify_answer?(answer)
    @first_op - @second_op == answer
  end
end

# Multiplication question
class MultiplicationQuestion < MathQuestion

  def initialize(player_name, first_operand, second_operand)
    super(player_name, first_operand, 'times', second_operand)
  end

  def verify_answer?(answer)
    @first_op * @second_op == answer
  end
end

# Division question
class DivisionQuestion < MathQuestion

  def initialize(player_name, first_operand, second_operand)
    super(player_name, first_operand, 'divided by', second_operand)
  end

  def verify_answer?(answer)
    @first_op / @second_op == answer
  end
end

# Generate a random skill-testing arithmetic question
def generate_question(player_name)
  which_type = rand(0..3)
  first_operand = rand(1..20)
  second_operand = rand(1..20)

  case which_type
  when 0
    AdditionQuestion.new(player_name, first_operand, second_operand)
  when 1
    SubtractionQuestion.new(player_name, first_operand, second_operand)
  when 2
    MultiplicationQuestion.new(player_name, first_operand, second_operand)
  when 3
    DivisionQuestion.new(player_name, first_operand, second_operand)
  end
end
