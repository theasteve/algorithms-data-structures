
class Heap {
  constructor() {
    this.n = 0;
    this.pq = [];
  }

  size() {
    return this.n;
  }

  isEmpty() {
    this.n === 0;
  }

  swim(k) {
    while(k > 1 && this.less(Math.floor(k / 2), k)){
      this.exch(Math.floor(k / 2), k);
      k = Math.floor(k / 2)
    }
  }

  sink(k) {
    while(2 * k <= this.n) {
      let j = 2 * k;

      if(this.pq[j + 1] != null) {
        if(k > 1 && this.less(j, j + 1)){
          j++;
        }
      }

      if(this.pq[k] > this.pq[j]) {
        break;
      }
      this.exch(k, j)
      k = j
    }
  }

  insert(v) {
    this.pq[++this.n] = v;
    this.swim(this.n);
  }

  delMax() {
    let max = this.pq[1];
    this.exch(1, this.n--);
    this.pq[this.n + 1] = null;
    this.sink(1);
    return max;
  }

  less(i, j) {
    return this.pq[i] < this.pq[j];
  }

  exch(i, j) {
    let temp = this.pq[i];
    this.pq[i] = this.pq[j];
    this.pq[j] = temp;
  }
}

let heap = new Heap();
heap.insert("t")
heap.insert("p")
heap.insert("r")
heap.insert("n")
heap.insert("h")
heap.insert("o")
heap.insert("a")
heap.insert("e")
heap.insert("i")
heap.insert("g")
heap.insert("s")

console.log(heap.pq)
console.log(heap.isEmpty())
console.log(heap.size())

console.log('----cookie-----')
heap.pq = [null, 't', 's', 'r', 'n', 'p','o', 'a', 'e', 'i', 'g', 'h']
heap.delMax()

console.log(heap.pq)
heap.delMax()
console.log(heap.pq)

