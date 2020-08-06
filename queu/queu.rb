require 'pry'

class Queu
  attr_accessor :first, :last, :size

  def initialize
    @first = nil
    @last  = nil
    @size  = 0
  end

  def enqueu(item)
    # Add item to the end of the list
    old_last = @last
    @last = Node.new(item)
    if @first.nil?
      @first = @last
    else
      old_last.next = @last
    end
    @size += 1
  end

  def dequeu
    # Remove item from the beginning of the list
    item = @first.val
    @first = @first.next
    if(is_empty)
      @last = nil
    end
    @size -= 1
    item
  end

  def is_empty
    @first.nil?
  end

  def size
    @size
  end

  private

  class Node
    attr_accessor :val, :next

    def initialize(value)
      @val = value
      @next = nil
    end
  end
end
