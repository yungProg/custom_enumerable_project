# frozen_string_literal: true

# module mimic built-in Enumerable module
module Enumerable
  # Your code goes here
  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_count
    counter = 0
    if block_given?
      my_each do |element|
        counter += 1 if yield(element)
      end
    else
      my_each do |element|
        counter += 1 if element
      end
    end
    counter
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self # rubocop:disable Style/For
      yield(element)
    end
  end
end

puts [991,2,3].my_count {|a| a > 2}