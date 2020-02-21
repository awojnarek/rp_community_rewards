#!/usr/bin/env ruby

require 'yaml'

#############
# Variables #
#############

# This will be if they are civ or crim
type_of_player = ARGV[0]

# This is our data structure.
data = YAML.load(File.read("rewards.yaml"))

pp data

