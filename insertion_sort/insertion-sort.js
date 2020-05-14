// Insertion Sort in Algorithms book chapter 2
//

function insertionSort(a) {
  n = a.length

  for(let i=1; i<n; i++) {
    for(let j=i; j>=0 && a[j] < a[j-1]; j--){
      let temp = a[j-1]
      a[j-1] = a[j]
      a[j] = temp
    }
  }
  console.log(a)
  return a;
}

insertionSort([1,4,5,6,7,8,10,2,3])
