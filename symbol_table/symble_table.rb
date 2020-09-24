require 'pry'

# Sequential Search Dictionary
class SequentialSearchST
  attr_accessor :first

  def initialize
    @first = nil
  end

  def get(key)
    x = @first

    while x != nil
      if key == x.key
        return x.val
      end
      x = x.next_
    end
    nil
  end

  def put(key, val)
    x = @first

    while x != nil
      if key == x.key
        return x.val = val
      end
      x = x.next_
    end

    @first = Node.new(key, val, @first)
  end

  private

  class Node
    attr_accessor :key, :val, :next_

    def initialize(key, val, next_)
      @key = key
      @value = val
      @next_ = next_
    end
  end
end

st = SequentialSearchST.new
st.put('s', 0)
st.put('e', 1)
st.put('a', 2)
st.put('r', 3)
st.put('c', 4)
st.put('h', 5)
st.put('e', 6)
st.put('x', 7)
st.put('a', 9)
st.put('m', 10)
st.put('p', 11)
st.put('l', 12)
st.put('e', 13)
binding.pry
puts 'o'
