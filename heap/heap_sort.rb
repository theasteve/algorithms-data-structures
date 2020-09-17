require 'pry'

# Heap Priority Queu
class Heap
  # Trickledown
  def sink(a, k, n)
    while 2 * k <= n
      j = 2 * k # child

      if j + 1 <= n # check if there is a right child
        j += 1 if j > 1 && less(a, j, j + 1) # if left child less than right child
      end

      break if !less(a, k, j) # If parent greater than child break
      swap(a, k, j)
      k = j
    end
  end

  def sort(a)
    n = a.length
    k = n / 2

    while k >= 1  #review what does this loop does
      sink(a, k, n)
      k -= 1
    end

    while n > 1
      swap(a, 1, n)
      n -= 1
      sink(a, 1, n)
    end
    a
  end

  def less(pq, i, j)
    pq[i - 1] < pq[j - 1]
  end

  def swap(a, i, j)
    temp = a[i - 1]
    a[i - 1] = a[j - 1]
    a[j - 1] = temp
  end
end

input = ["S", "O", "R", "T", "E", "X", "A", "M", "P", "L", "E"]

heap = Heap.new
p heap.sort(input)
