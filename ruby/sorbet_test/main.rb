# frozen_string_literal: true
# typed: strict

require 'sorbet-runtime'

# Solving Advent of Code with Ruby and Sorbet - https://www.youtube.com/watch?v=ww75lvdayJU
# load 'main.rb'
# input = ['1000', '2000', '3000', '', '4000', '', '5000', '6000', '', '7000', '8000', '9000', '', '10000']
# Main.part_one(input)
# Main.part_two(input)
module Main
  class << self
    extend T::Sig

    sig { params(input: T::Array[String]).returns(Integer) }
    def part_one(input)
      elves = parse_input(input)

      T.must(elves.max)
    end

    sig { params(input: T::Array[String]).returns(Integer) }
    def part_two(input)
      elves = parse_input(input)

      T.must(elves.max(3).reduce(&:+))
    end

    private

    sig { params(input: T::Array[String]).returns(T::Array[Integer]) }
    def parse_input(input)
      current_calories = 0
      elves = T.let([], T::Array[Integer])

      input.each do |line|
        if line == ''
          elves << current_calories
          current_calories = 0
        else
          current_calories += line.to_i
        end
      end

      elves
    end
  end
end
