# frozen_string_literal: true

require 'pry'

def partition(a, lo, hi)
  i = lo
  j = hi + 1
  v = a[i]

  while true
    while a[i += 1] < v
      break if i == hi
    end
    while v < a[j -= 1]
      break if j == lo
    end
    break if i >= j

    # Parallel Assignment
    a[i], a[j] = a[j], a[i]
  end

  a[lo], a[j] = a[j], a[lo]
  j
end

samp_a = ['k', 'r', 'a', 't', 'e', 'l', 'e', 'p', 'u', 'i', 'm', 'q', 'c', 'x', 'o', 's']
lo = 0
hi = 15

partition(samp_a, lo, hi)
