

class Queu {
  constructor(){
    this.first = null;
    this.last  = null;
    this.size  = 0;
  }

  getSize() {
    return this.size;
  }

  isEmpty() {
    return this.first === null;
  }

  enqueu(item) {
    let oldLast = this.last;
    this.last = new Node(item);
    if(this.first === null) {
      this.first = this.last;
    }
    else {
      oldLast.next = this.last;
    }
    this.size++;
    return
  }

  dequeu() {
    let item = this.first.val;
    this.first = this.first.next;
    if(this.first === null) {
      this.last = null;
    }
    this.size--;
    return item;
  }
};

class Node {
  constructor(value) {
    this.val = value;
    this.next = null;
  }
};

let obj = new Queu();
obj.getSize() // 0
obj.enqueu(1)
obj.enqueu(2)
obj.enqueu(3)
console.log(obj.getSize()) // 3
obj.isEmpty() // false
console.log(obj.dequeu()); // 1
console.log(obj.getSize()); // 2
obj.dequeu();
obj.dequeu();
console.log(obj.isEmpty()); // true
