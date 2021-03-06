#!/usr/bin/env ruby

require 'json'

variables = {}
ARGF.each_line do |line|
  row = line.chomp.split(',')
  if row[2] == "artifact" && row[4] == "id"
    variables[row[1] + "_ami"] = {default: Hash[*row[5].split(/:|%\!\(PACKER_COMMA\)/)]}
  end
end

puts ({variable: variables}.to_json)
