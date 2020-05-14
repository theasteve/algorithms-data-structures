#
# Selection sort from chapter 2 in Algorithms book
#
require 'pry'

def selection_sort(a)
  n = a.length
  i = 0

  while i < n do
    min = i
    j = i + 1
    while j < n
      if a[j] < a[min]
        temp = a[min]
        a[min] = a[j]
        a[j] = temp
      end
      j += 1
    end
    i += 1
  end
  
  puts a
end

selection_sort([4,5,3,7,1,2,8,10])
