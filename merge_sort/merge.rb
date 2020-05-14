# Algorithms, 4th Edition by Robert Sedgewick
# implementation of book algorithms in JavaScript
# author of Ruby implementation Steven Aguilar
# Githut: @theasteve  email: stevenaguilarcs@gmail.com

require 'pry'

def merge(a, lo, mid, hi)
  i = lo
  j = mid + 1
  aux = []

  k = lo
  while k <= hi do
    aux[k] = a[k]
    k += 1
  end

  k = lo
  while k <= hi do
    if i > mid
      a[k] = aux[j]
      j += 1
    elsif j > hi
      a[k] = aux[i]
      i += 1
    elsif aux[j] < aux[i]
      a[k] = aux[j]
      j += 1
    else
      a[k] = aux[i]
      i += 1
    end

    k += 1
  end

  a
end

a = ['E','E','G','M','R','A','C','E','R','T']
lo = 0
mid = (a.length - 1) / 2
hi = a.length - 1

p merge(a, lo, mid, hi)
