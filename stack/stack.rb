require "pry"

class Stack
  attr_accessor :first, :n

  def initialize
    @first = nil
    @n = 0  # number of elements in the Stack
  end

  class Node
    attr_accessor :item, :next

    def initialize
      @item = 0
      @next = nil
    end
  end

  def is_empty?
    @n == 0
  end

  def size
    @n
  end

  def push(item)
    old_first = @first
    @first = Node.new
    @first.item = item
    @first.next = old_first
    @n += 1
  end

  def pop
    # Remove first item from the list
    item = @first.item
    @first = first.next
    @n -= 1
    item
  end
end

binding.pry

puts "cookie"
