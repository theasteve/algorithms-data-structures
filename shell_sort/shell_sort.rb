##
## Shell Sort in Ruby 
##


def shell_sort(a)
  n = a.length # Size of input
  h = 1
  h = h * 3 + 1 while h < n / 3

  while h >= 1
    i = h
    while i < n
      j = i
      while j >= h && a[j] < a[j - h]
        temp = a[j - h]
        a[j - h] = a[j]
        a[j] = temp

        j -= h
      end
      i += 1
    end
    h = (h / 3).to_i
  end
  a
end

p shell_sort([9,7,2,3,4,1,6,11,5])
