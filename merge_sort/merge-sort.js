class Merge {
  constructor() {
    this.aux = []
  }

  sortP(a) {
    this.sort(a, 0, a.length - 1)
  }

  merge(a, lo, mid, hi) {
    let i = lo
    let j = mid + 1

    for(let i = lo; i <= hi; i++) {
      this.aux[i] = a[i]
    }

    for(let k = lo; k <= hi; k++) {
      if(i > mid) {
        a[k] = this.aux[j++]
      }
      else if(j > hi) {
        a[k] = this.aux[i++]
      }
      else if(this.aux[j] < this.aux[i]){
        a[k] = this.aux[j++]
      }
      else{
        a[k] = this.aux[i++]
      }
    }

    return a
  }

  sort(a, lo, hi) {
    if(hi <= lo) { return; }
    let mid = parseInt((hi + lo) / 2)
    this.sort(a,lo,mid)
    this.sort(a,mid+1,hi)
    this.merge(a, lo, mid, hi)
  }
}

const a = ["M", "E", "R", "G", "E", "S", "O", "R", "T", "E", "X", "A", "M", "P", "L", "E"]
const mergeSort = new Merge;
mergeSort.sortP(a)
console.log(a)
