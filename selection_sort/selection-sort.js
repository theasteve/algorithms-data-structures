//
// Selection Sort algorithm from Algorithms book chapter 2
//
//

function selectionSort(a) {
  let n = a.length;

  for (let i=0; i < n; i++) {
    let min = i;
    for (let j=i+1; j < n; j++) {
      if (a[j] < a[min]) {
        let temp = a[min]
        a[min] = a[j]
        a[j] = temp
      }
    }
  }
  console.log(a);
  return a
}

selectionSort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
