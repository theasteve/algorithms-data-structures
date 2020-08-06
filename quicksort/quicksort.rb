# frozen_string_literal: true
require 'pry'
# Implementation of inplace Quicksort
class Quicksort

  def public_sort(a)
    a = a.shuffle
    sort(a, 0, a.length - 1)
    a
  end

  private

  def sort(a, lo, hi)
    return if hi <= lo

    j = partition(a, lo, hi)
    sort(a, lo, j - 1)
    sort(a, j + 1, hi)
  end

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

      a[i], a[j] = a[j], a[i]
    end
    a[lo], a[j] = a[j], a[lo]
    j
  end
end

test = ["Q", "U", "I", "C", "K", "S", "O", "R", "T", "E", "X", "A", "M", "P", "L", "E"]
binding.pry
quicksort = Quicksort.new
example = quicksort.publi_sort(test)
p example
