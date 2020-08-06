/**
 * initialize your data structure here.
 */
var MinStack = function() {
  this.size = 0;
  this.min = null;
  this.first = null;
};

var Node = function(val) {
  this.val = val;
  this.next = null;
};
/** 
 * @param {number} x
 * @return {void}
 */
MinStack.prototype.push = function(x) {
  if(this.first == null) {
    this.first = new Node(x);
    this.min = this.first;
    this.size++;
    return
  }

  let newNode = new Node(x);
  if(newNode.val < this.min.val) {
    this.min = newNode;
  }
  let oldFirst = this.first;
  newNode.next = oldFirst;
  this.first = newNode;
  this.size++;
};
/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
  if(this.first === null) {
    return;
  }
  if(this.min === this.first) {
    let current = this.first.next;
    this.min = current;
    while(current != null) {
      if(current.val < this.min.val || this.size === 2) {
        this.min = current;
      }
      current = current.next;
    }
  }
  this.first = this.first.next;
  this.size--;
  return
};
/**
 * @return {number}
 */
MinStack.prototype.top = function() {
  return this.first.val;
};
/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
    return this.min.val;
};

// ["MinStack","push","push","push","getMin","pop","top","getMin"]
// [[],[-2],[0],[-3],[],[],[],[]]
 
var obj = new MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
console.log(obj.getMin());
obj.pop();
obj.top();
obj.getMin();
