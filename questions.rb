@question_types = {add: 'plus', subtract: 'minus', multiply: 'times', divide: 'divided by'}

# Generate a skill-testing arithmetic question
# This function will return a hash that includes
# the text of the question, the arithmetic operation being tested
# the first and second operands on the aritmetic operation
def generate_question(player_name)
  question = {}
  which_type = rand(0..(@question_types.size - 1))
  first_operand = rand(1..20)
  second_operand = rand(1..20)
  question_type = @question_types.keys[which_type]
  question_text = "#{player_name}, what is #{first_operand} #{@question_types[question_type]} #{second_operand}? "

  question[:text] = question_text
  question[:type] = question_type
  question[:first_num] = first_operand
  question[:second_num] = second_operand

  question
end

# Verify an answer to the skill-testing arithmetic question
def verify_answer?(question, answer)
  case question[:type]
  when :add
    question[:first_num] + question[:second_num] == answer
  when :subtract
    question[:first_num] - question[:second_num] == answer
  when :multiply
    question[:first_num] * question[:second_num] == answer
  when :divide
    question[:first_num] / question[:second_num] == answer
  end
end

def get_question_text(question)
  question[:text]
end

