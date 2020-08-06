// Runtime: 52 ms, faster than 73.39% of JavaScript online submissions for Implement Queue using Stacks.
// Memory Usage: 32.9 MB, less than 100.00% of JavaScript online submissions for Implement Queue using Stacks.
// https://leetcode.com/problems/implement-queue-using-stacks/submissions/
// author: @theasteve email: stevenaguilarcs@gmail.com


// Initialize your data structure here.
var MyQueue = function() {
  this.first = null;
  this.last = null;
  this.size = 0;
};

var Node = function(value) {
  this.val = value;
  this.next = null;
};

/**
 * Push element x to the back of queue. 
 * @param {number} x
 * @return {void}
 */
MyQueue.prototype.push = function(x) {
  // Add to the end of the list
  let oldLast = this.last;
  this.last = new Node(x);
  if(this.first === null) {
    this.first = this.last;
  } else {
    oldLast.next = this.last
  }
  this.size++;
  return
};

/**
 * Removes the element from in front of queue and returns that element.
 * @return {number}
 */
MyQueue.prototype.pop = function() {
  let item = this.first.val;
  this.first = this.first.next;
  if(this.first === null) {
    this.last = null;
  }
  this.size--;
  return item;
};

/**
 * Get the front element.
 * @return {number}
 */
MyQueue.prototype.peek = function() {
  return this.first.val;
};

/**
 * Returns whether the queue is empty.
 * @return {boolean}
 */
MyQueue.prototype.empty = function() {
  return this.first === null;
};

/**
 * Returns whether the queue is empty.
 * @return {boolean}
 */
MyQueue.prototype.empty = function() {
  return this.first === null;
};
