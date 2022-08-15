# RB120
# Are you the one


num_couples = 10
perms = (1..num_couples).to_a.permutation

perm_array = []
perms.each{ |perm| perm_array << perm }

# choose the winning combination
winning_comb = perm_array.sample 
guesses = 1
puts "The winning combination is: #{winning_comb}"
puts "You have a 1 in #{perm_array.length} chance of winning"

loop do
  # truth booth (choose one couple from the available combinations)
  puts "---------------------------"
  puts "Welcome to the truth booth!"
  random_comb = perm_array.sample
  boy = (0...num_couples).to_a.sample
  girl = random_comb[boy]
  puts "The truth booth combination is: Boy-#{boy + 1} and Girl-#{girl}"

  # result is a match
  # include only permutations where girl is in the boy index
  if winning_comb[boy] == girl
    perm_array = perm_array.select { |perm| perm[boy] == girl }
    puts "Match!"
  # result is not a match
  # include only permutations where girl is NOT in the boy index
  else
    perm_array = perm_array.reject { |perm| perm[boy] == girl }
    puts "No Match!"
  end
  puts "After the truth booth, you have a 1 in #{perm_array.length} chance of winning"


  # matching ceremony
  # choose one permutation from the available combinations
  puts "---------------------------------"
  puts "Welcome to matching ceremony number #{guesses}!"
  def calculate_matches(new_comb, winning_comb)
    count = 0
      new_comb.each_with_index do |num, idx|
        count += 1 if num == winning_comb[idx]
      end
    count
  end

  def update_perm_array(curr_array, mc_comb, num_beams)
    new_array = curr_array.select do |poss_comb|
                  calculate_matches(poss_comb, mc_comb) == num_beams
                end
    new_array.delete(mc_comb)
    new_array
  end

  mc_comb = perm_array.sample

  puts "The matching ceremony combination is:"
  p mc_comb

  num_beams = calculate_matches(mc_comb, winning_comb)
  case num_beams
  when num_couples 
    puts "You won!"
    break
  when 0 then puts "Blackout!"
  when 1 then puts "There is 1 beam!"
  else 
    puts "There are #{num_beams} beams!"
  end

  perm_array = update_perm_array(perm_array, mc_comb, num_beams)
  puts "After the matching ceremony, you have a 1 in #{perm_array.length} chance of winning"
  guesses += 1
end

puts "Congratulations, you solved the problem in #{guesses} guesses"


# winner?
# 


# flow of the game
  # winning combination is displayed
  # odds are displayed
  # guesses is initialized to 0
  # loop starts here
  # Truth Booth flow
    # computer chooses a couple
    # computer's choice is displayed
    # result of the truth booth is displayed
    # combinations are updated
  # Matching Ceremony flow
    # computer chooses a combination
    # computer's choice is displayed
    # guesses is incremented by 1
    # result of the matching ceremony is displayed
      # possible results: blackout, number of beams, or winner
      # break out of loop if winner
    # combinations are updated
  # Display number of guesses

