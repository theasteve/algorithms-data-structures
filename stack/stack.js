class Stack {
  constructor() {
    this.first = null;
    this.size = 0;
  }

  isEmpty() {
    return this.first === null;
  }

  sizeOfStack() {
    return this.size;
  }

  push(item) {
    if(this.first === null) {
      this.first = item;
      this.size++;
      return
    }

    let old_first = this.first;
    let node = new Node(item);
    node.next = old_first;
    this.first = node;
    this.size++;
    return
  }

  pop() {
    if(this.first === null) { return }
    let item = this.first;
    this.first = this.first.next;
    this.size--;
    return item;
  }
}

class Node {
  constructor(value){
    this.next = null;
    this.value = value;
  }
}

let stack = new Stack();
stack.isEmpty();
stack.push('A');
stack.push('B');
stack.push('C');
stack.pop();
stack.sizeOfStack();

