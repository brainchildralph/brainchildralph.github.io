---
layout: post
title: "Javascript Notes"
description: "Javascript Notes"
date: 2018-08-09 17:20:00+0800
categories: [javascript]
tags:
  - javascript
author: kisaku
image:
comments: true
---

<div markdown="1" class="list-group">
<strong>[Index](#index){: .list-group-item .list-group-item-info}</strong>
[Dump function script](#dump-function-script){: .list-group-item .list-group-item-action} 
[How to use Call, Apply, Bind](#how-to-use-call-apply-bind){: .list-group-item .list-group-item-action}
[Promise](#promise){: .list-group-item .list-group-item-action} 
</div>

---
##### Dump function script ##### 
dump.js:  
{: .text-info}
```vim
function func1(){
  console.log("func1!!");
}
console.log(func1.toString());
```
<div markdown="1">
If you know nodejs, you can use `node` to do test as below.  
</div>
```
node dump.js
```
---
##### How to use Call, Apply, Bind  
<br/>
<p markdown="1">Call and apply are the other ways to call function. The first parameter will replace `this`, and the difference between `call` and `apply` is the rest parameters. Call uses normal parameter input, and apply uses the array-based parameter input.</p>
<p>Normal function call: </p>
Example:  
{: .text-info}
```vim
var obj={
  x:5,
  z:'zzz',
  func1:function(){
    console.log('this.x: '+this.x+', this.y: '+this.y+', this.z: '+this.z+', arguments: '+JSON.stringify(arguments));
  }
}
obj.func1();
```
Output:  
{: .text-danger}
<div markdown="1"  class="d-block bg-output"> 
```
this.x: 5, this.y: undefined, this.z: zzz, arguments: {}
```
</div>
<p>Use `call` to call function:  </p>
Example:  
{: .text-info}
```vim
var obj={
  x:5,
  z:'zzz',
  func1:function(){
    console.log('this.x: '+this.x+', this.y: '+this.y+', this.z: '+this.z+', arguments: '+JSON.stringify(arguments));
  }
}
obj.func1.call({x:10,y:5}, "argv1", "argv2");
```
Output:  
{: .text-danger}
<div markdown="1"  class="d-block bg-output"> 
```
this.x: 10, this.y: 5, this.z: undefined, arguments: {"0":"argv1","1":"argv2"}
```
</div>
<p>Use `apply` to call function:  </p>
Example:  
{: .text-info}
```vim
var obj={
  x:5,
  z:'zzz',
  func1:function(){
    console.log('this.x: '+this.x+', this.y: '+this.y+', this.z: '+this.z+', arguments: '+JSON.stringify(arguments));
  }
}
var args=[];
args.push("argv1");
args.push("argv2");
obj.func1.apply({x:10,y:5}, args);
```
Output:  
{: .text-danger}
<div markdown="1"  class="d-block bg-output"> 
```
this.x: 10, this.y: 5, this.z: undefined, arguments: {"0":"argv1","1":"argv2"}

```
</div>
---
##### Promise  

```vim
var PENDING = 0;
var FULFILLED = 1;
var REJECTED = 2;

/**
 * Check if a value is a Promise and, if it is,
 * return the `then` method of that promise.
 *
 * @param {Promise|Any} value
 * @return {Function|Null}
 */
function getThen(value) {
  var t = typeof value;
  if (value && (t === 'object' || t === 'function')) {
    var then = value.then;
    if (typeof then === 'function') {
      return then;
    }
  }
  return null;
}

/**
 * Take a potentially misbehaving resolver function and make sure
 * onFulfilled and onRejected are only called once.
 *
 * Makes no guarantees about asynchrony.
 *
 * @param {Function} fn A resolver function that may not be trusted
 * @param {Function} onFulfilled
 * @param {Function} onRejected
 */
function doResolve(fn, onFulfilled, onRejected) {
  var done = false;
  try {
    fn(function (value) {
      if (done) return
      done = true
      onFulfilled(value)
    }, function (reason) {
      if (done) return
      done = true
      onRejected(reason)
    })
  } catch (ex) {
    if (done) return
    done = true
    onRejected(ex)
  }
}

function Promise(fn) {
  // store state which can be PENDING, FULFILLED or REJECTED
  var state = PENDING;

  // store value once FULFILLED or REJECTED
  var value = null;

  // store sucess & failure handlers
  var handlers = [];

  function fulfill(result) {
    state = FULFILLED;
    value = result;
    handlers.forEach(handle);
    handlers = null;
  }

  function reject(error) {
    state = REJECTED;
    value = error;
    handlers.forEach(handle);
    handlers = null;
  }

  function resolve(result) {
    try {
      var then = getThen(result);
      if (then) {
        doResolve(then.bind(result), resolve, reject)
        return
      }
      fulfill(result);
    } catch (e) {
      reject(e);
    }
  }

  function handle(handler) {
    if (state === PENDING) {
      handlers.push(handler);
    } else {
      if (state === FULFILLED &&
        typeof handler.onFulfilled === 'function') {
        handler.onFulfilled(value);
      }
      if (state === REJECTED &&
        typeof handler.onRejected === 'function') {
        handler.onRejected(value);
      }
    }
  }

  this.done = function (onFulfilled, onRejected) {
    // ensure we are always asynchronous
    setTimeout(function () {
      handle({
        onFulfilled: onFulfilled,
        onRejected: onRejected
      });
    }, 0);
  }

  this.then = function (onFulfilled, onRejected) {
    var self = this;
    return new Promise(function (resolve, reject) {
      return self.done(function (result) {
        if (typeof onFulfilled === 'function') {
          try {
            return resolve(onFulfilled(result));
          } catch (ex) {
            return reject(ex);
          }
        } else {
          return resolve(result);
        }
      }, function (error) {
        if (typeof onRejected === 'function') {
          try {
            return resolve(onRejected(error));
          } catch (ex) {
            return reject(ex);
          }
        } else {
          return reject(error);
        }
      });
    });
  }

  doResolve(fn, resolve, reject);
}

console.log('before p1');
var p1=new Promise(function(resolve, reject){
  setTimeout(function(){
    resolve(3); 
  }, 5000);
});
p1.then(function(){
  console.log('ok!!');
}, function(){
  console.log('fail!!');
});
p1.done(function(){
  console.log('done!!');
});
console.log('after p1');
```

To be continued...

