require 'pry'


# Heap Priority Queu
class Heap
  attr_accessor :pq, :n

  def initialize
    @pq = [] # heap order complete binary tree
    @n = 0 # in pq[1..N] with pq[0] unused
  end

  def empty?
    @n == 0
  end

  def size
    @n
  end

  def insert(v)
    @pq[@n += 1] = v
    swim(@n) # position in heap
  end

  # trickleup
  def swim(k)
    while k > 1 && less((k / 2).floor, k) # parent: k/2 parent less than child?
      swap((k/2).floor, k)
      k = k / 2
    end
  end

  def del_max
    max = @pq[1]  # Retrieve max key from top.
    swap(1, @n) # Exchange with last item.
    @n -= 1
    @pq[@n + 1] = nil # Avoid loitering. max added to end on swap make nil
    sink(1) # Restore HEAP property
    max
  end

  # Trickledown
  def sink(k)
    while 2 * k <= @n
      j = 2 * k # child

      if !@pq[j + 1].nil? # check if there is a right child
        j += 1 if j > 1 && @pq[j] < @pq[j + 1] # if left child less than right child
      end
      break if @pq[k] > @pq[j] # If parent greater than child break

      swap(k, j)
      k = j
    end
  end

  def less(i, j)
    @pq[i] < @pq[j]
  end

  def swap(i, j)
    temp = @pq[i]
    @pq[i] = @pq[j]
    @pq[j] = temp
  end
end


heap= Heap.new
# heap.insert(4)
# heap.insert(1)
# heap.insert(2)
# heap.insert(1)
# SORTEXAMPLE
heap.insert('S')
heap.insert('O')
heap.insert('R')
heap.insert('T')
heap.insert('E')
heap.insert('X')
heap.insert('A')
heap.insert('M')
heap.insert('P')
heap.insert('L')
heap.insert('E')


binding.pry
puts "cookie"
