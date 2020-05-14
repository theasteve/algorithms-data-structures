// Algorithms, 4th Edition by Robert Sedgewick
// implementation of book algorithms in JavaScript
// author of javascript implementation Steven Aguilar
// Githut: @theasteve  email: stevenaguilarcs@gmail.com


function merge(a, lo, mid, hi) {
  let aux = []
  let i = lo
  let j = mid + 1

  for(let i = lo; i <= hi; i++) {
    aux[i] = a[i]
  }
  for(let k = lo; k <= hi; k++) {
    if(i > mid) {
      a[k] = aux[j++]
    }
    else if(j > hi) {
      a[k] = aux[i++]
    }
    else if(aux[j] < aux[i]){
      a[k] = aux[j++]
    }
    else{
      a[k] = aux[i++]
    }
  }
  console.log(a)
  return a;
}

a = ['E','E','G','M','R','A','C','E','R','T']
lo = 0
mid = parseInt((a.length - 1) / 2)
hi = a.length - 1

merge(a,lo,mid,hi)


