require 'pry'

class Merge
  attr_accessor :aux

  def sort_public(a)
    @aux = []
    sort(a,0, a.length - 1)
  end

  def merge(a, lo, mid, hi)
    i = lo
    j = mid + 1

    k = lo
    while k <= hi do
      @aux[k] = a[k]
      k += 1
    end

    k = lo
    while k <= hi do
      if i > mid
        a[k] = @aux[j]
        j += 1
      elsif j > hi
        a[k] = @aux[i]
        i += 1
      elsif aux[j] < aux[i]
        a[k] = @aux[j]
        j += 1
      else
        a[k] = @aux[i]
        i += 1
      end

      k += 1
    end

    a
  end

  private

  def sort(a, lo, hi)
    return if hi <= lo
    mid = lo + (hi - lo) / 2
    sort(a,lo, mid) #sort left half
    sort(a,mid + 1, hi) # sort right half
    merge(a,lo, mid, hi)
  end
end


merge = Merge.new

a = ["M", "E", "R", "G", "E", "S", "O", "R", "T", "E", "X", "A", "M", "P", "L", "E"]

p merge.sort_public(a)
