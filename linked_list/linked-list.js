var Node = function(val) {
  this.val = val;
  this.next = null;
}


/**
 * Initialize your data structure here.
 */
var MyLinkedList = function() {
  this.head = null;
  this.size = 0;
  this.tail = null;
};

/**
 * Get the value of the index-th node in the linked list. If the index is invalid, return -1. 
 * @param {number} index
 * @return {number}
 */
MyLinkedList.prototype.get = function(index) {
  if(this.head === null) { return -1 }
  if(index > this.size - 1) { return -1 }

  if(index === 0) {
    return this.head.val;
  }

  if(index === this.size - 1) {
    return this.tail.val;
  }

  let j = 0;
  for(let i = this.head; i !== null; i = i.next) {
    if(j === index){
      return i.val;
    }
    j++;
  }
};

/**
 * Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtHead = function(val) {
  let node = new Node(val);

  node.next = this.head;
  if(this.head === null) {
    this.tail = node;
  }
  this.head = node;
  this.size++;
  return
};

/**
 * Append a node of value val to the last element of the linked list. 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtTail = function(val) {
  if(this.head === null) {
    return this.addAtHead(val);
  }

  let node = new Node(val);
  this.tail.next = node;
  this.tail = node;
  this.size++;
};

/**
 * Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. 
 * @param {number} index 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtIndex = function(index, val) {
  if(index === 0) {
    return this.addAtHead(val);
  }
  if(index === this.size) {
    return this.addAtTail(val);
  }
  if(index > this.size) { return }

  let j = 0
  for(let i = this.head; i !== null;i = i.next) {
    if(j === index - 1) {
      let temp = i.next
      let node = new Node(val);
      i.next = node;
      node.next = temp;
      this.size++;
      return
    }
    j++;
  }
};

/**
 * Delete the index-th node in the linked list, if the index is valid. 
 * @param {number} index
 * @return {void}
 */
MyLinkedList.prototype.deleteAtIndex = function(index) {
  if(index < 0 || index > this.size - 1) { return }
  if(index === 0) {
    return this.deleteAtHead();
  }

  if(index === this.size - 1) {
    return this.deleteAtTail();
  }
  let j = 0;
  for(let i = this.head; i !== null; i = i.next) {
    if(j === index - 1) {
      i.next = i.next.next;
      this.size--;
      return;
    }
    j++;
  }

};

MyLinkedList.prototype.deleteAtHead = function() {
  if(this.head === null) {
    return
  }

  if(this.head === this.tail){
    this.head = null;
    this.tail = null;
    this.size--;
    return
  }

  this.head = this.head.next;
  this.size--;
  return
};

MyLinkedList.prototype.deleteAtTail = function() {
  if(this.head === null){ return }
  if(this.head === this.tail){
    return this.deleteAtHead();
  }

  let current = this.head;
  let prev = null;

  while(current !== null) {
    prev = current
    current = current.next;
  }
};

/** 
 * Your MyLinkedList object will be instantiated and called as such:
 * var obj = new MyLinkedList()
 * var param_1 = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index,val)
 * obj.deleteAtIndex(index)
 */

// https://leetcode.com/problems/design-linked-list/discuss/647240/JavaScript%3A-Faster-than-93-of-all-submissions
