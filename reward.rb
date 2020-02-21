#!/usr/bin/env ruby

require 'yaml'

#############
# Variables #
#############

# This will be if they are civ or crim
type_of_player = ARGV[0]
simulation     = ARGV[2]
name           = ARGV[1]

# This is our data structure.
yaml_data = YAML.load(File.read("rewards.yaml"))


#############
# Functions #
#############

def calculate_chance(perc)
  return true if perc == 100

  n = []
  100.times do |e|
    n << e 
  end

  sample = n.sample
  
  return true unless sample >= perc
  return false
end

def pick_random(array, pick)
    picked = []
    already_picked = []
    
    pick.times do |e|
        s = array.sample
        item = s.keys[0]
        amount = s[item]
        if item == "Cash"
            picked << [ item, amount ]
            array.delete(s)
        else
            random_amount = rand(1..amount)
            picked << [ item, random_amount ]
            array.delete(s)
        end
    end

    return picked
end

def generate_reward(data)

  rewards = []
  data.keys.each do |e|

    level = data[e]
    
    next if calculate_chance(level["Chance"]) == false

    pick = level["Pick"]
    items = level["Items"]

    items = pick_random(items, pick)

    rewards << items
  end

  return rewards
end

########
# Main #
########

# First let's figure out whether we're doing criminal or civ

data = yaml_data["Rewards"]["Civ"]  if type_of_player == "civ"
data = yaml_data["Rewards"]["Crim"] if type_of_player == "crim"

if data == nil 
  printf "Specify civ or crim on input\n"
  exit 1
end 

# If we didn't specify anything, just generate one reward
if simulation == nil
    printf "Thank you for boosting the server #{name}! Below is your random reward: \n"
    rewards = generate_reward(data)

    count = rewards.count
    count.times do |c|
        printf "Level #{c} Rewards\n"
        e = rewards[c]
        e.each do |f|
            printf "\t-#{f[0]} x#{f[1]}\n"
        end

        printf "\n"
    end
end

if simulation != nil
    rewards = generate_reward(data)
    count = rewards.count
    printf "#{count}\n"
end




