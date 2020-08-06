# Runtime: 32 ms, faster than 75.00% of Ruby online submissions for Implement Queue using Stacks.
# Memory Usage: 9.4 MB, less than 100.00% of Ruby online submissions for Implement Queue using Stacks.
# https://leetcode.com/problems/implement-queue-using-stacks/submissions/

class MyQueue

=begin
    Initialize your data structure here.
=end
    def initialize
      @first = nil
      @last = nil
      @size = 0
    end


=begin
    Push element x to the back of queue.
    :type x: Integer
    :rtype: Void
=end
    def push(x)
      old_last = @last
      @last = Node.new(x)
      if(@first == nil)
        @first = @last
      else
        old_last.next = @last
      end
      @size += 1
    end


=begin
    Removes the element from in front of queue and returns that element.
    :rtype: Integer
=end
    def pop
      item = @first.val
      @first = @first.next
      @last = nil if(@first == nil)
      @size -= 1
      item
    end


=begin
    Get the front element.
    :rtype: Integer
=end
    def peek
      @first.val
    end


=begin
    Returns whether the queue is empty.
    :rtype: Boolean
=end
    def empty
      @first.nil?
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
