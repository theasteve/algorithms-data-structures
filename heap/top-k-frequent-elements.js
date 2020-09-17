/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function(nums, k) {
    let heap = new Heap();
    let t = {};
    let ans = []

    for(let i=0; i < nums.length; i++) {
       let num = nums[i];
       t[num] = t[num] ? t[num] + 1 : 1
    }

    for(const key in t) {
        let o = {}
        o[key] = t[key]
        heap.insert(o)
    }

    for(let i = k; k > 0; k--) {
      let el = heap.delMax();
      ans.push(Object.keys(el)[0])
    }
    return ans;
};

class Heap {
    constructor() {
        this.n = 0;
        this.pq = [];
    }

    size() {
        return this.n
    }

    isEmpty() {
        return this.n === 0;
    }

    insert(v) {
        this.pq[++this.n] = v;
        this.swim(this.n);
    }

    swim(k) {
        while(k > 1 && this.less(Math.floor(k / 2), k)) {
            this.exch(Math.floor(k / 2), k)
            k = Math.floor(k / 2)
        }
    }

    delMax() {
        let max = this.pq[1];
        this.exch(1, this.n--);
        this.pq[this.n + 1] = null;
        this.sink(1)
        return max
    }

    sink(k) {
        while(2 * k <= this.n) {
            let j = 2 * k;
            if(j + 1 <= this.n) {
                if(j > 1 && this.less(j, j + 1)) j++
            }

            if(!this.less(k,j)) break;

            this.exch(k, j);
            k = j;
        }
    }

    less(i, j) {
        return Object.values(this.pq[i])[0] < Object.values(this.pq[j])[0]
    }

    exch(i, j) {
        let temp = this.pq[i];
        this.pq[i] = this.pq[j];
        this.pq[j] = temp;
    }
}

topKFrequent([1,1,1,2,2,3], 2)
