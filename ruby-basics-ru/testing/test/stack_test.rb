# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_one
    arr_test = ['one', 2, 3, 'four']
    stack = Stack.new(['one', 2, 3, 'four'])
    assert { stack.clear! == arr_test.clear }
  end

  def test_two
    arr_test = ['one', 2, 3, 'four']
    arr_test.pop
    stack = Stack.new(['one', 2, 3, 'four'])
    stack.pop!
    assert { stack.to_a == arr_test }
  end

  def test_three
    arr_test = ['one', 2, 3, 'four']
    stack = Stack.new(['one', 2, 3, 'four'])
    assert { stack.push!(5) == arr_test.push(5) }
  end

  def test_four
    arr_test = ['one', 2, 3, 'four']
    stack = Stack.new(['one', 2, 3, 'four'])
    assert { stack.empty? == arr_test.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
