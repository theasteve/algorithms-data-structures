class MyLinkedList
    attr_accessor :head, :size, :tail
=begin
    Initialize your data structure here.
=end
    def initialize()
      @head = nil
      @size = 0
      @tail = nil
    end
=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
   :rtype: Integer
=end
    def get(index)
      return -1 if @head == nil
      return -1 if index > @size - 1
      return @head.val if index == 0
      return @tail.val if index == @size - 1
      i = @head
      j = 0
      while i != nil
        if j == index
          return i.val
        end
        i = i.next
        j += 1
      end
      -1
    end
=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
      new_node = Node.new(val)
      new_node.next = @head
      @tail = new_node if @head == nil
      @head = new_node
      @size += 1
    end
=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
      return add_at_head(val) if @head == nil
      node = Node.new(val)
      @tail.next = node
      @tail = node
      @size += 1
    end
=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
      return add_at_head(val) if index == 0
      return add_at_tail(val) if @head == @tail
      return add_at_tail(val) if @size == index
      return if index > @size
      i = @head
      j = 0
      while i != nil
        if j == index - 1
          tmp = i.next
          node = Node.new(val)
          i.next = node
          node.next = tmp
          @size += 1
          return
        end
        i = i.next
        j += 1
      end
    end
=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
      return if index < 0 || index > @size - 1
      return delete_at_head if index == 0
      return delete_at_tail if index == @size - 1
      i = @head
      j = 0
      while i != nil
        if j == index - 1
         i.next = i.next.next
         @size -= 1
         return
        end
        i = i.next
        j += 1
      end
    end

    def delete_at_head
      if @head == nil
        return nil
      elsif @head == @tail #one element in the linked list
        @head = nil
        @tail = nil
        @size -= 1
        return
      else
        @head = @head.next
        @size -= 1
      end
    end

    def delete_at_tail
      if @head == nil
        return nil
      elsif @head == @tail
        return delete_at_head
      end
      current = @head
      prev = nil
      while(current != tail)
        prev = current
        current = current.next
      end
      prev.next = nil
      @tail = prev
      @size -= 1
      return
    end

    private

    class Node
        attr_accessor :val, :next
        def initialize(val)
            @val = val
            @next = nil
        end
    end
end
# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)
# Input
# ["MyLinkedList","addAtHead","get","addAtHead","addAtHead","deleteAtIndex","addAtHead","get","get","get","addAtHead","deleteAtIndex"]
#
# [[],[4],[1],[1],[5],[3],[7],[3],[3],[3],[1],[4]]
#
# Output
# [null,null,4,null,null,null,null,4,4,4,null,null]
# Expected
# [null,null,-1,null,null,null,null,4,4,4,null,null]
obj = MyLinkedList.new()
binding.pry
obj.add_at_head(0)
obj.get(1)
obj.add_at_index(1,4)
obj.add_at_tail(8)
obj.add_at_head(5)
obj.add_at_index(4,3)
obj.add_at_tail(0) 
obj.add_at_tail(5)
obj.add_at_index(6,3)
obj.delete_at_index(7)
obj.delete_at_index(5)
obj.add_at_tail(4)
binding.pry
