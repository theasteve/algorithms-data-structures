require 'pry'
# Binary Search Symbol Table in Ruby
class BinarySearchST
  attr_accessor :n, :keys, :vals

  def initialize
    @n = 0
    @keys = []
    @vals = []
  end

  def size
    @n
  end

  def is_empty?
    @n.zero?
  end

  def get(key)
    return nil if is_empty?

    i = rank(key)
    if i < @n && @keys[i] == key
      @vals[i]
    else
      nil
    end
  end

  def rank(key)
    lo = 0
    hi = @n - 1

    while lo <= hi
      mid = lo + (hi - lo) / 2
      cmp = (key <=> @keys[mid])
      if cmp < 0
        hi = mid - 1
      elsif cmp > 0
        lo = mid + 1
      else
        return mid
      end
    end
    lo
  end

  def put(key, val)
    #  Search for key. Update value if found; grow table if new
    i = rank(key)
    if i < @n && @keys[i] == key
      return @vals[i] = val
    end

    j = @n
    while j > i
      @keys[j] = @keys[j - 1]
      @vals[j] = @vals[j - 1]

      j -= 1
    end

    @keys[i] = key
    @vals[i] = val
    @n += 1
  end

  def min
    @keys[0]
  end

  def max
    @keys[-1]
  end

  def select(k)
    @keys[k]
  end

  def ceiling(key)
    i = rank(key)
    @keys[i]
  end

  def floor(key)
    raise 'ilegalArgumentException' if key == nil
    raise 'NoSuchElementException' if @keys.empty?

    i = rank(key)
    if keys[i] == key
      keys[i]
    else
      keys[i - 1]
    end
  end

  def delete(key)
    raise 'ilegalArgumentException' if key.nil?

    i = rank(key)

    @keys.delete_at(i)
    @vals.delete_at(i)
  end
end


bst = BinarySearchST.new

bst.put('s', 0)
bst.put('e', 1)
bst.put('a', 2)
bst.put('r', 3)
bst.put('c', 4)
bst.put('h', 5)
bst.put('e', 6)
bst.put('x', 7)
bst.put('a', 8)
bst.put('m', 9)
bst.put('p', 10)
bst.put('l', 11)
bst.put('e', 12)

binding.pry
p bst.get('e')
puts 'cookie'
