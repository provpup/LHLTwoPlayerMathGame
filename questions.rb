require_relative('questions')

@max_lives = 3
@player_one = {name: nil, lives: nil}
@player_two = {name: nil, lives: nil}

def prompt_for_name(default_player_name)
  print "Please enter name for #{default_player_name}: "
  gets.chomp
end

def question_round(player)
  question_to_ask = generate_question(player[:name])
  puts
  puts
  print get_question_text(question_to_ask)
  answer = gets.chomp.to_i
  correct_answer = verify_answer?(question_to_ask, answer)

  if correct_answer
    puts "Correct, #{player[:name]}!"
    0
  else
    puts "Sorry that was incorrect, #{player[:name]}"
    1
  end
end

def display_scores(player1, player2)
  player_one_wins = player1[:lives] > player2[:lives]
  player_two_wins = !player_one_wins

  print "Player 1 (#{player1[:name]}): #{player1[:lives]}"
  print " (WINNER)" if player_one_wins
  puts
  print "Player 2 (#{player2[:name]}): #{player2[:lives]}"
  print " (WINNER)" if player_two_wins
  puts
  puts
end

quit_now_tag = "n"
play_again = ""
until play_again == quit_now_tag
  @player_one[:lives] = @max_lives
  @player_two[:lives] = @max_lives
  @player_one[:name] = prompt_for_name('Player 1') if @player_one[:name].nil?
  @player_two[:name] = prompt_for_name('Player 2') if @player_two[:name].nil?

  until @player_one[:lives] == 0 || @player_two[:lives] == 0
    @player_one[:lives] -= question_round(@player_one)
    @player_two[:lives] -= question_round(@player_two)
  end

  display_scores(@player_one, @player_two)
  puts
  play_again_tag = "y"
  print "Do you want to play again? (#{play_again_tag}/#{quit_now_tag}) "
  play_again = gets.chomp
end

puts "Thanks for playing!"
