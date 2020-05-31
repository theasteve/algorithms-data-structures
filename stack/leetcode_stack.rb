# frozen_string_literal: true
require 'pry'

# A Stack implementation in Ruby. for test cases visit LeetCode
# https://leetcode.com/problems/min-stack/
# Author @theasteve, email: steven.aguilarcs@gmail.com
class MinStack
  attr_accessor :first, :size, :min

  def initialize
    @first = nil
    @size = 0
    @min = nil
  end


  def push(x)
    if @first.nil?
      @size += 1
      node = Node.new(x)
      @first = node
      @min = node
      return
    end

    node = Node.new(x)
    @min = node if node.val < @min.val
    old_first = @first
    node.next = old_first
    @first = node
    @size += 1
  end

  def pop
    return if @first.nil?

    if @min == @first
      current = @first.next
      @min = current

      while !current.nil?
        @min = current if current.val < @min.val || @size == 2

        current = current.next
      end
    end
    @first = @first.next
    @size -= 1
  end

  def top
    @first.val
  end

  def get_min
    @min.val
  end

  # Node class to be use within MinStack implementation.
  class Node
    attr_accessor :val, :next
    def initialize(val)
      @val = val
      @next = nil
    end
  end
end
