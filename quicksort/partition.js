
function partition(a, lo, hi) {
  let i = lo;
  let j = hi + 1;
  let v = a[i]

  while(true) {
    while(a[++i] < v) {
      if(i === hi) { break; }
    }
    while(v < a[--j]) {
      if(j === lo) { break; }
    }
    if(i >= j) { break; }
    swap(a, i, j)
  }
  swap(a, lo, j)
  return j
}

function swap(arr, a, b) {
  let temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

let samp_a = ['k', 'r', 'a', 't', 'e', 'l', 'e', 'p', 'u', 'i', 'm', 'q', 'c', 'x', 'o', 's']
let lo = 0
let hi = 15

console.log(partition(samp_a, lo, hi))
