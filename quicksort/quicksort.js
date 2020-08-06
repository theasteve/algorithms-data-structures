class QuickSort {
  sort(a) {
    a = this.shuffle(a); //Shuffling is needed for perfomance guarantee.
    this.privateSort(a,0, a.length - 1)
    return a;
  }

  privateSort(a, lo, hi) {
    if(hi <= lo) { return }
    let j = this.partition(a, lo, hi);
    this.privateSort(a, lo, j - 1)
    this.privateSort(a, j + 1, hi)
  }

  partition(a, lo, hi) {
    let i = lo;
    let j = hi + 1;
    let v = a[lo];

    while (true) {
      while (a[++i] < v) {
        if (i >= hi) { break; };
      }
      while (v < a[--j]) {
        if (j <= lo) { break; };
      }
      if (i >= j) { break; }
      this.swap(a, i, j);
    }
    this.swap(a, lo, j);
    return j;
  }

  swap(a, firstEl, secondEl) {
    let temp = a[firstEl];
    a[firstEl] = a[secondEl];
    a[secondEl] = temp;
  }

  // Knuth-Fisher-Yates shuffle algorithm
  shuffle(arr) {
    for (var i = arr.length - 1; i > 0; i--) {
      const swapIndex = Math.floor(Math.random() * (i + 1))
      const currentEl = arr[i]
      const elToSwap  = arr[swapIndex]

      arr[i] = elToSwap;
      arr[swapIndex] = currentEl;
    }
    return arr;
  }
}

let sample = ["Q", "U", "I", "C", "K", "S", "O", "R", "T", "E", "X", "A", "M", "P", "L", "E"];
const obj = new QuickSort();
sample = obj.sort(sample);
console.log(sample)
