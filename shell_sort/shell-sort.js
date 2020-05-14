// Shell sort for JS in Algorithms chapter 2
//
//
function shellSort(a) {
  let N = a.length // size of input
  let h = 1

  while(h > N/3) {
    h = 3 * h + 1
  }
  while(h >= 1) {
    for(let i = h; i < N; i++) {
      for(let j = i; j >= h && a[j] < a[j - h]; j -= h) {
        let temp = a[j - h]
        a[j - h] = a[j]
        a[j] = temp
      }
    }
    h = parseInt(h / 3)
  }
  return a;
}
console.log(shellSort([7,11,3,6,2,5,9,8,1,10]))
