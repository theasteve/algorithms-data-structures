class BinarySearchSt {
  constructor() {
    this.n = 0;
    this.keys = [];
    this.vals = [];
  }

  isEmpty() {
    return this.n === 0;
  }

  get(key) {
    if(this.isEmpty() === true) {
      return null;
    }

    let i = this.rank(key);

    if (i < this.n && this.keys[i] === key) {
      return this.vals[i];
    } else {
      return null;
    }
  }

  put(key, val) {
    let i = this.rank(key);
    if(i < this.n && this.keys[i] === key) {
      return this.vals[i] = val;
    }

    for(let j = this.n; j > i; j--) {
      this.keys[j] = this.keys[j - 1];
      this.vals[j] = this.vals[j - 1];
    }
    this.keys[i] = key;
    this.vals[i] = val;
    this.n++;
  }

  rank(key) {
    let lo = 0;
    let hi = this.n - 1;

    while(lo <= hi) {
      let mid = lo + Math.floor((hi - lo) / 2);
      let cmp = this.compareTo(key, this.keys[mid]);
      if(cmp < 0) {
        hi = mid - 1;
      } else if(cmp > 0) {
        lo = mid + 1;
      } else {
        return mid;
      }
    }
    return lo;
  }

  compareTo(val1, val2) {
    if((val1 === null || val2 === null) || (typeof val1 !== typeof val2)) {
      return null;
    }
    if (typeof val1 === 'string') {
      return (val1).localeCompare(val2);
    } else {
      if(val1 > val2){
        return 1;
      } else if (val1 < val2) {
        return -1;
      }
      return 0;
    }
  }

  min() {
    return this.keys[0];
  }

  max() {
    return this.keys[-1]
  }

  select(index) {
    return this.keys[index];
  }

  ceiling(key) {
    let i = this.rank(key);
    return this.keys[i];
  }

  // floor(key) {}
  //
  // delete(key) {}
}

const bst = new BinarySearchSt();

bst.put('s', 0)
bst.put('e', 1)
bst.put('a', 2)
bst.put('r', 3)
bst.put('c', 4)
bst.put('h', 5)
bst.put('e', 6)
bst.put('x', 7)
bst.put('a', 8)
bst.put('m', 9)
bst.put('p', 10)
bst.put('l', 11)
bst.put('e', 12)

console.log(bst.get('e'))

