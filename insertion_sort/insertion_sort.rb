# Isertion sort of Algorithms book chapter 2

def insertion_sort(a)
  n = a.length
  i = 1

  while i < n
    j = i
    while j >= 0 && a[j] < a[j - 1]
      temp = a[j - 1]
      a[j - 1] = a[j]
      a[j] = temp

      j -= 1
    end
    i += 1
  end

  a
end

p insertion_sort([1,4,5,6,7,8,10,2,3])
