require_relative('questions')
require_relative('player')

# This MathGame class allows 2 players to play a math
# question game until a player provides enough wrong
# answers to the questions to end the game
class MathGame

  def initialize(player_1_name, player_2_name)
    @player_one = Player.new(player_1_name)
    @player_two = Player.new(player_2_name)
  end

  def reset
    @player_one.reset
    @player_two.reset
  end

  def display_scores
    player_one_wins = @player_one.lives > @player_two.lives
    player_two_wins = !player_one_wins

    puts
    print "Player 1 (#{@player_one.name}): #{@player_one.lives}"
    print ' (WINNER)' if player_one_wins
    puts
    print "Player 2 (#{@player_two.name}): #{@player_two.lives}"
    print ' (WINNER)' if player_two_wins
    puts
    puts
  end

  def question_round(player)
    question_to_ask = generate_question(player.name)
    puts
    puts
    print question_to_ask.question_text
    answer = gets.chomp.to_i

    if question_to_ask.verify_answer?(answer)
      puts "Correct, #{player.name}!"
    else
      puts "Sorry that was incorrect, #{player.name}"
      player.lives = player.lives - 1
    end
  end

  def play_round    
    until @player_one.dead? || @player_two.dead?
      question_round(@player_one)
      question_round(@player_two) unless @player_one.dead?
    end

    display_scores
  end
end

def prompt_for_name(default_player_name)
  print "Please enter name for #{default_player_name}: "
  gets.chomp
end


quit_now_tag = 'n'
play_again = ''
player_1_name = prompt_for_name('Player 1')
player_2_name = prompt_for_name('Player 2')
game = MathGame.new(player_1_name, player_2_name)
until play_again == quit_now_tag
  game.reset
  game.play_round

  puts
  play_again_tag = 'y'
  print "Do you want to play again? (#{play_again_tag}/#{quit_now_tag}) "
  play_again = gets.chomp
end

puts 'Thanks for playing!'
