// Symbol Table using Sequential search (Linked List)
//
class SequentialSearchST {

  constructor() {
    this.first = null;
  }

  get(key) {
    for(let x = this.first; x != null; x = x.next) {
      if(x.key === key) {
        return x.val
      }
    }
    return null;
  }

  put(key, val) {
    for(let x = this.first; x != null; x = x.next) {
      if(x.key === key) {
        return x.val = val
      }
    }
    this.first = new Node(key, val, this.first);
  }

}

class Node {
  constructor(key, val, next) {
    this.key = key;
    this.val = val;
    this.next = next;
  }
}

st = new SequentialSearchST();
st.put('s', 0)
st.put('e', 1)
st.put('a', 2)
st.put('r', 3)
st.put('c', 4)
st.put('h', 5)
st.put('e', 6)
st.put('x', 7)
st.put('a', 9)
st.put('m', 10)
st.put('p', 11)
st.put('l', 12)
st.put('e', 13)
console.dir(st.get('s'));
