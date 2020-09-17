require 'pry'

############################################################################
# Priority Queue implementation using a binary heap
############################################################################
class MinPQ
  attr_accessor :n, :heap

  def initialize
    @n = 0
    @heap = []
  end

  def insert(v)
    @heap[@n += 1] = v
    swim(@n) # rehepify bottom up
  end

  def swim(k)
    while k > 1 && @heap[k / 2] > @heap[k]
      exch(k / 2, k)
      k /= 2
    end
  end

  def del_min
    min = @heap[1]
    exch(1, @n)
    @n -= 1
    @heap[n + 1] = nil
    sink(1)
    min
  end

  def sink(k)
    while 2 * k <= @n
      j = 2 * k

      if j + 1 <= @n
        j += 1 if j > 1 && @heap[j] > @heap[j + 1]
      end

      break if @heap[k] < @heap[j]

      exch(k, j)
      k = j
    end
  end

  def exch(i, j)
    temp = @heap[i]
    @heap[i] = @heap[j]
    @heap[j] = temp
  end
end


arr = [90, 15, 10, 7, 12, 2, 7, 3]
min_pq = MinPQ.new
arr.each do |num|
  min_pq.insert(num)
end

p min_pq.heap
min_pq.del_min
p min_pq.heap

