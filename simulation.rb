#!/usr/bin/env ruby

number_of_times = ARGV[0].to_i
hash  = Hash.new(0)

printf "Criminals\n"
number_of_times.times do |e|
    count = %x[./reward.rb crim 1].strip
    hash[count] += 1
end

printf "Number of simulations: #{number_of_times}\n"
printf "Criminal reward levels: this is the number of people who got the below level of rewards\n"
printf "Level 1: #{hash["1"]}\n"
printf "Level 2: #{hash["2"]}\n"
printf "Level 3: #{hash["3"]}\n"
printf "Level 4: #{hash["4"]}\n"
printf "Level 5: #{hash["5"]}\n"
printf "\n\n"

printf "Civilian\n"
number_of_times.times do |e|
    count = %x[./reward.rb crim 1].strip
    hash[count] += 1
end

printf "Number of simulations: #{number_of_times}\n"
printf "Criminal reward levels: this is the number of people who got the below level of rewards\n"
printf "Level 1: #{hash["1"]}\n"
printf "Level 2: #{hash["2"]}\n"
printf "Level 3: #{hash["3"]}\n"
printf "Level 4: #{hash["4"]}\n"
printf "Level 5: #{hash["5"]}\n"