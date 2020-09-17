require 'pry'

def top_k_frequent(nums, k)
  ans = 0
  h = Hash.new(0)

  nums.each do |num|
    h[num] += 1
  end

  heap = Heap.new
  h.each do |k,v|
    heap.insert({k => v})
  end

  k.times do
    a = heap.del_max
    ans.push(a.keys[0])
  end

  ans
end


class Heap
  attr_accessor :n, :pq

  def initialize
    @n = 0
    @pq = []
  end

  def insert(v)
    @pq[@n += 1] = v
    swim(@n)
  end

  def swim(k)
    while k > 1 && less((k / 2).floor, k)
      swap((k / 2).floor, k)
      k = k/2
    end
  end

  def swap(i, j)
    temp = @pq[i]
    @pq[i] = @pq[j]
    @pq[j] = temp
  end

  def less(i, j)
    @pq[i].values[0] < @pq[j].values[0]
  end

  def del_max
    max = @pq[1]
    swap(1, @n)
    @n -= 1
    @pq[@n + 1] = nil
    sink(1)
    max
  end

  def sink(k)
    while 2 * k <= @n
      j = 2 * k

      if !@pq[j + 1].nil?
        j += 1 if j > 1 && @pq[j].values[0] < @pq[j + 1].values[0]
      end
      break if !less(k, j)

      swap(k, j)
      k = j
    end
  end
end

top_k_frequent([5,3,1,1,1,3,73,1],2)
