<div align="center">
  <img height="60" src="https://img.icons8.com/color/344/javascript.png">
  <h1>JavaScript Output Questions</h1>
</div>

A comprehensive collection of JavaScript output-based interview questions to test your understanding of core concepts like hoisting, type coercion, closures, event loop, and more.

---

## Questions

### 1. What is the output of `3+2+"7"`?

```javascript
console.log(3 + 2 + "7");
```

<details>
<summary><b>Answer</b></summary>

**Output:** `"57"`

**Explanation:**

In JavaScript, the addition operator has left-to-right associativity. The expression is evaluated as follows:
- First, `3 + 2` is evaluated, resulting in `5`
- Then, `5 + "7"` is evaluated
- When adding a number and a string, JavaScript performs type coercion and converts the number to a string
- The expression becomes `"5" + "7"`, which performs string concatenation
- Final result: `"57"`

</details>

---

### 2. What is the output of the comparison operations?

```javascript
const a = 1 < 2 < 3;
const b = 1 > 2 > 3;
console.log(a, b);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `true, false`

**Explanation:**

JavaScript comparison operators (`<` and `>`) have left-to-right associativity:

**For `a`:**
- `1 < 2 < 3` evaluates as `(1 < 2) < 3`
- `(1 < 2)` returns `true`
- `true < 3` is then evaluated
- JavaScript coerces the boolean `true` to the number `1`
- `1 < 3` returns `true`

**For `b`:**
- `1 > 2 > 3` evaluates as `(1 > 2) > 3`
- `(1 > 2)` returns `false`
- `false > 3` is then evaluated
- JavaScript coerces the boolean `false` to the number `0`
- `0 > 3` returns `false`

</details>

---

### 3. Object comparison: What's the output?

```javascript
const p = { k: 1, l: 2 };
const q = { k: 1, l: 2 };
let isEqual = p == q;
let isStrictEqual = p === q;
console.log(isEqual, isStrictEqual);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `false, false`

**Explanation:**

In JavaScript, when comparing objects using `==` or `===`, you're comparing their references in memory, not their contents:
- `p` and `q` are two different objects stored at different memory locations
- Even though they have identical properties and values, they are not the same object
- Both `==` (loose equality) and `===` (strict equality) check reference equality for objects
- Since they reference different objects in memory, both comparisons return `false`

To compare object contents, you would need to compare each property individually or use a deep equality function.

</details>

---

### 4. Type coercion in arithmetic operations

```javascript
console.log(2 + 2);
console.log("2" + "2");
console.log(2 + 2 - 2);
console.log("2" + "2" - "2");
console.log(4 + "2" + 2 + 4 + "25" + 2 + 2);
```

<details>
<summary><b>Answer</b></summary>

**Output:** 
- `4`
- `"22"`
- `2`
- `20`
- `"42242522"`

**Explanation:**

**a) `2 + 2`:** Simple addition of two numbers = `4`

**b) `"2" + "2"`:** String concatenation = `"22"`

**c) `2 + 2 - 2`:** 
- Left-to-right evaluation: `(2 + 2) - 2`
- `4 - 2` = `2`

**d) `"2" + "2" - "2"`:**
- First: `"2" + "2"` = `"22"` (string concatenation)
- Then: `"22" - "2"` (subtraction operator coerces strings to numbers)
- `22 - 2` = `20`

**e) `4 + "2" + 2 + 4 + "25" + 2 + 2`:**
- `4 + "2"` = `"42"` (number coerced to string)
- `"42" + 2` = `"422"` (concatenation)
- `"422" + 4` = `"4224"` (concatenation)
- `"4224" + "25"` = `"422425"` (concatenation)
- `"422425" + 2` = `"4224252"` (concatenation)
- `"4224252" + 2` = `"42242522"` (concatenation)

</details>

---

### 5. String immutability

```javascript
let a = 'jscafe';
a[0] = 'c';
console.log(a);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `"jscafe"`

**Explanation:**

Strings are immutable in JavaScript:
- You cannot change individual characters by index
- The assignment `a[0] = 'c'` fails silently (no error, no change)
- To modify a string, you must create a new string:
  ```javascript
  a = "cscafe"; // This works - creates a new string
  ```

</details>

---

### 6. Variable scoping with `var`

```javascript
var x = 10;
function foo() {
  var x = 5;
  console.log(x);
}
foo();
console.log(x);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `5` and `10`

**Explanation:**

This demonstrates variable scoping in JavaScript:

1. `var x = 10;` - Declares a global variable `x` with value `10`
2. Inside `foo()`, `var x = 5;` creates a new local variable `x` scoped to the function
3. The local `x` shadows the global `x` within the function
4. `console.log(x)` inside `foo()` logs the local `x` = `5`
5. `console.log(x)` outside `foo()` logs the global `x` = `10`

The local variable does not affect the global variable.

</details>

---

### 7. Event loop: Microtasks vs Macrotasks

```javascript
console.log("Start");
setTimeout(() => {
  console.log("Timeout");
});
Promise.resolve().then(() => console.log("Promise"));
console.log("End");
```

<details>
<summary><b>Answer</b></summary>

**Output:** `Start`, `End`, `Promise`, `Timeout`

**Explanation:**

This demonstrates the JavaScript event loop and task queues:

1. **Synchronous code executes first:**
   - `"Start"` is logged
   - `"End"` is logged

2. **Microtasks (Promises) execute before Macrotasks:**
   - `Promise.resolve().then()` is a microtask
   - Microtasks execute after the current script but before the next macrotask
   - `"Promise"` is logged

3. **Macrotasks execute last:**
   - `setTimeout` is a macrotask
   - Even with 0ms delay, it's queued in the macrotask queue
   - `"Timeout"` is logged last

**Order:** Synchronous code → Microtasks → Macrotasks

</details>

---

### 8. Closure with `var` in loop (Most Asked)

```javascript
function x() {
  for (var i = 1; i <= 5; i++) {
    setTimeout(() => {
      console.log(i);
    }, i * 1000);
  }
}
x();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `6` logged 5 times (at 1s, 2s, 3s, 4s, 5s intervals)

**Explanation:**

- `var` has function scope, not block scope
- The loop completes before any `setTimeout` callback executes
- All callbacks reference the same `i` variable
- After the loop, `i` equals `6`
- All callbacks log `6`

**Solution 1: Use `let` (block-scoped)**
```javascript
for (let i = 1; i <= 5; i++) {
  setTimeout(() => {
    console.log(i); // Logs 1, 2, 3, 4, 5
  }, i * 1000);
}
```

**Solution 2: Use closure**
```javascript
function x() {
  function createClosure(val) {
    setTimeout(() => {
      console.log(val);
    }, val * 1000);
  }
  
  for (var i = 1; i <= 5; i++) {
    createClosure(i); // Creates a new scope for each i
  }
}
```

</details>

---

### 9. Closure and variable reference

```javascript
function x() {
  let a = 10;
  function d() {
    console.log(a);
  }
  a = 500;
  return d;
}
var z = x();
z();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `500`

**Explanation:**

This demonstrates closure and lexical scoping:

1. Function `d` is defined inside `x` and captures the variable `a` by reference (not by value)
2. After defining `d`, the value of `a` is changed to `500`
3. `x()` returns the function `d`
4. When `z()` (which is `d`) is called, it accesses the current value of `a` in its closure
5. Since `a` was updated to `500` before `d` was returned, it logs `500`

**Key concept:** Closures capture variables by reference, not by value. They access the current value of the variable, not the value at the time the closure was created.

</details>

---

### 10. Function hoisting vs variable hoisting

```javascript
getData1();
getData();

function getData1() {
  console.log("getData1");
}

var getData = () => {
  console.log("Hello");
};
```

<details>
<summary><b>Answer</b></summary>

**Output:** `"getData1"` then `TypeError: getData is not a function`

**Explanation:**

This demonstrates the difference between function declarations and function expressions:

**Function Declaration (getData1):**
- Fully hoisted to the top of the scope
- Can be called before its definition in the code
- `getData1()` works and logs `"getData1"`

**Function Expression (getData):**
- Only the variable declaration (`var getData`) is hoisted, initialized as `undefined`
- The arrow function assignment happens at runtime
- At the time `getData()` is called, `getData` is still `undefined`
- Calling `undefined()` throws `TypeError: getData is not a function`

**To fix:** Move function calls after the definitions or use function declarations.

</details>

---

### 11. `try-catch-finally` with `return`

```javascript
function func() {
  try {
    console.log(1);
    return;
  } catch (e) {
    console.log(2);
  } finally {
    console.log(3);
  }
  console.log(4);
}
func();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `1` and `3`

**Explanation:**

1. `console.log(1)` executes in the `try` block
2. `return` is encountered, which exits the function
3. **Before returning, the `finally` block always executes**
4. `console.log(3)` executes in the `finally` block
5. The function returns
6. `console.log(4)` never executes because `return` was called
7. The `catch` block doesn't execute because no error occurred

**Key concept:** The `finally` block always executes, even when there's a `return`, `break`, or `continue` statement in `try` or `catch`.

</details>

---

### 12. `break` in `forEach`

```javascript
const nums = [1, 2, 3, 4, 5, 6, 7];
nums.forEach((n) => {
  if (n % 2 === 0) {
    break;
  }
  console.log(n);
});
```

<details>
<summary><b>Answer</b></summary>

**Output:** `SyntaxError: Illegal break statement`

**Explanation:**

- The `break` statement only works with loops (`for`, `while`, `do...while`)
- `forEach()`, `map()`, `filter()`, etc. are array methods that accept callbacks, not loops
- You cannot use `break` or `continue` inside these callbacks

**Alternatives:**
- Use a traditional `for` loop if you need `break`
- Use `some()` or `every()` methods which allow early termination
- Use `for...of` loop

```javascript
// Using for...of
for (const n of nums) {
  if (n % 2 === 0) break;
  console.log(n);
}

// Using some() for early exit
nums.some((n) => {
  if (n % 2 === 0) return true; // stops iteration
  console.log(n);
  return false;
});
```

</details>

---

### 13. Infinite loop with `setTimeout`

```javascript
let a = true;
setTimeout(() => {
  a = false;
}, 2000);
while (a) {
  console.log('-- inside while --');
}
```

<details>
<summary><b>Answer</b></summary>

**Output:** Infinite loop printing `'-- inside while --'` continuously (browser will freeze/crash)

**Explanation:**

This creates an infinite loop because:

1. `a` is set to `true`
2. `setTimeout` schedules a callback to set `a = false` after 2 seconds
3. The `while(a)` loop starts executing immediately
4. **The loop never yields control back to the event loop**
5. The `setTimeout` callback can never execute because JavaScript is single-threaded
6. The `while` loop blocks the thread indefinitely

**Key concept:** Synchronous code (like `while` loops) blocks the JavaScript event loop, preventing asynchronous callbacks from executing.

**Solution:** Use asynchronous patterns like async/await, Promises, or interval checks.

</details>

---

### 14. Event loop: setTimeout, Promise, and sync code

```javascript
setTimeout(() => console.log(1), 0);
console.log(2);
new Promise(res => {
  console.log(3);
  res();
}).then(() => console.log(4));
console.log(5);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `2`, `3`, `5`, `4`, `1`

**Explanation:**

**Execution order:**

1. **Synchronous code executes first:**
   - `console.log(2)` → logs `2`
   - Promise executor (synchronous): `console.log(3)` → logs `3`
   - `console.log(5)` → logs `5`

2. **Microtasks (Promises) execute next:**
   - Promise `.then()` callback → logs `4`

3. **Macrotasks (setTimeout) execute last:**
   - `setTimeout` callback → logs `1`

**Key concept:** 
- Promise executors run synchronously
- Promise `.then()` callbacks are microtasks
- `setTimeout` callbacks are macrotasks
- Order: Sync → Microtasks → Macrotasks

</details>

---

### 15. Async/await execution order

```javascript
async function foo() {
  console.log("A");
  await Promise.resolve();
  console.log("B");
  await new Promise(resolve => setTimeout(resolve, 0));
  console.log("C");
}
console.log("D");
foo();
console.log("E");
```

<details>
<summary><b>Answer</b></summary>

**Output:** `D`, `A`, `E`, `B`, `C`

**Explanation:**

**Step-by-step execution:**

1. `console.log("D")` → logs `D` (synchronous)
2. `foo()` is called:
   - `console.log("A")` → logs `A` (synchronous)
   - `await Promise.resolve()` pauses `foo()` and queues the continuation as a microtask
3. Control returns to main context
4. `console.log("E")` → logs `E` (synchronous)
5. **Microtask queue processes:**
   - `foo()` resumes
   - `console.log("B")` → logs `B`
   - `await new Promise(...)` with `setTimeout` pauses `foo()` again (macrotask)
6. **Macrotask queue processes:**
   - `setTimeout` callback resolves the Promise
   - `foo()` resumes
   - `console.log("C")` → logs `C`

</details>

---

### 16. `delete` operator on variables

```javascript
let output = (function(x) {
  delete x;
  return x;
})(3);
console.log(output);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `3`

**Explanation:**

- The `delete` operator is used to remove properties from objects, not variables
- `delete x` has no effect on the function parameter `x`
- In non-strict mode, `delete` on a variable fails silently
- In strict mode, it throws a `SyntaxError`
- The function simply returns `x`, which is `3`

**Key concept:** `delete` only works on object properties, not on variables or function parameters.

</details>

---

### 17. `var` in `setTimeout` loop

```javascript
for (var i = 0; i < 3; i++) {
  setTimeout(function () {
    console.log(i);
  }, 1000 + i);
}
```

<details>
<summary><b>Answer</b></summary>

**Output:** `3` `3` `3` (at 1001ms, 1002ms, 1003ms)

**Explanation:**

This is similar to Question 8:

1. `var i` has function scope (or global scope), not block scope
2. The loop runs completely, incrementing `i` to `3`
3. All three `setTimeout` callbacks reference the same `i` variable
4. When the callbacks execute, `i` is already `3`
5. All three log `3`

**To fix:** Use `let` instead of `var` for block scoping, or use a closure (IIFE) to capture each value of `i`.

</details>

---

### 18. `setInterval` with `clearInterval`

```javascript
let c = 0;
let id = setInterval(() => {
  console.log(c++);
}, 10);
setTimeout(() => {
  clearInterval(id);
}, 2000);
```

<details>
<summary><b>Answer</b></summary>

**Output:** Logs `0`, `1`, `2`, `3`, ..., up to approximately `199` (may vary slightly)

**Explanation:**

1. `setInterval` executes every 10 milliseconds
2. Each execution logs the current value of `c` and then increments it
3. After 2000 milliseconds (2 seconds), `clearInterval` stops the interval
4. In 2000ms, with 10ms intervals, approximately 200 iterations occur
5. Logs: `0, 1, 2, 3, 4, ... 199` (approximately)

**Note:** The exact number may vary slightly due to JavaScript timing precision and event loop scheduling.

</details>

---

### 19. `this` in arrow function vs regular function

```javascript
function getName1() {
  console.log(this.name);
}
Object.prototype.getName2 = () => {
  console.log(this.name);
};
let personObj = {
  name: "Tony",
  print: getName1
};
personObj.print();
personObj.getName2();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `Tony` and `undefined`

**Explanation:**

**`personObj.print()` (regular function):**
- `getName1` is called with `personObj` as the context
- `this` refers to `personObj`
- `this.name` is `"Tony"`

**`personObj.getName2()` (arrow function):**
- Arrow functions don't have their own `this`
- They inherit `this` from the enclosing lexical scope
- `getName2` is defined at the global scope
- `this` refers to the global object (or `undefined` in strict mode)
- `this.name` is `undefined`

**Key concept:** Arrow functions don't bind their own `this`; they use `this` from the surrounding scope.

</details>

---

### 20. Function and variable hoisting

```javascript
function test() {
  console.log(a);
  console.log(foo());
  var a = 1;
  function foo() {
    return 2;
  }
}
test();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `undefined` and `2`

**Explanation:**

Due to hoisting, the code is interpreted as:

```javascript
function test() {
  var a;           // hoisted, initialized as undefined
  function foo() { // fully hoisted
    return 2;
  }
  
  console.log(a);     // undefined
  console.log(foo()); // 2
  a = 1;
}
```

- **Variable hoisting:** `var a` is hoisted and initialized as `undefined`
- **Function hoisting:** `function foo()` is fully hoisted and can be called before its declaration
- First `console.log(a)` logs `undefined`
- Second `console.log(foo())` logs `2`

</details>

---

### 21. Promise chain with rejection

```javascript
function job() {
  return new Promise((resolve, reject) => {
    reject();
  });
}
let promise = job();
promise
  .then(() => {
    console.log("1111111111");
  })
  .then(() => {
    console.log("22222222222");
  })
  .catch(() => {
    console.log("3333333333");
  })
  .then(() => {
    console.log("4444444444");
  });
```

<details>
<summary><b>Answer</b></summary>

**Output:** `3333333333` and `4444444444`

**Explanation:**

1. `job()` returns a Promise that is immediately rejected
2. The first `.then()` is skipped because the Promise was rejected
3. The second `.then()` is also skipped
4. The `.catch()` catches the rejection and logs `"3333333333"`
5. After `.catch()`, the Promise chain continues (`.catch()` returns a resolved Promise)
6. The final `.then()` executes and logs `"4444444444"`

**Key concept:** After a `.catch()` handles a rejection, the Promise chain continues with the next `.then()` unless the `.catch()` throws an error or returns a rejected Promise.

</details>

---

### 22. Variable hoisting in conditionals

```javascript
var a = 1;
function data() {
  if (!a) {
    var a = 10;
  }
  console.log(a);
}
data();
console.log(a);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `10` and `1`

**Explanation:**

Due to hoisting with `var`, the code is interpreted as:

```javascript
var a = 1;
function data() {
  var a; // hoisted to top of function, shadows global a
  if (!a) { // a is undefined (falsy)
    a = 10;
  }
  console.log(a); // 10
}
data();
console.log(a); // 1 (global a)
```

1. Inside `data()`, `var a` is hoisted and initialized as `undefined`
2. The condition `!a` is `true` because `undefined` is falsy
3. `a` is assigned `10`
4. First `console.log(a)` logs `10` (local variable)
5. Second `console.log(a)` logs `1` (global variable)

</details>

---

### 23. Array equality comparison

```javascript
function guessArray() {
  let a = [1, 2];
  let b = [1, 2];
  console.log(a == b);
  console.log(a === b);
}
guessArray();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `false` and `false`

**Explanation:**

- In JavaScript, arrays are objects
- When comparing objects (including arrays) with `==` or `===`, you're comparing references, not contents
- `a` and `b` are two different array objects in memory
- Even though they have the same elements, they're not the same object
- Both comparisons return `false`

**To compare array contents:**
```javascript
JSON.stringify(a) === JSON.stringify(b) // true
// Or compare each element individually
```

</details>

---

### 24. Number object vs primitive comparison

```javascript
let a = 3;
let b = new Number(3);
let c = 3;
console.log(a == b);
console.log(a === b);
console.log(b === c);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `true`, `false`, `false`

**Explanation:**

**`a == b` (loose equality):**
- `a` is a primitive number: `3`
- `b` is a Number object: `Number {3}`
- `==` performs type coercion
- The Number object is converted to its primitive value
- `3 == 3` returns `true`

**`a === b` (strict equality):**
- `a` is a primitive number
- `b` is an object
- Different types, no coercion
- Returns `false`

**`b === c` (strict equality):**
- `b` is an object
- `c` is a primitive number
- Different types
- Returns `false`

**Key concept:** `new Number()` creates an object, not a primitive. Use `===` to avoid type coercion surprises.

</details>

---

### 25. Nested IIFE and hoisting

```javascript
var x = 23;
(function() {
  var x = 43;
  (function random() {
    x++;
    console.log(x);
    var x = 21;
  })();
})();
```

<details>
<summary><b>Answer</b></summary>

**Output:** `NaN`

**Explanation:**

Due to hoisting in the `random` function:

```javascript
(function random() {
  var x; // hoisted, undefined
  x++;   // undefined++ = NaN
  console.log(x); // NaN
  x = 21;
})();
```

1. `var x = 21` is hoisted to the top as `var x;`
2. At the time of `x++`, `x` is `undefined`
3. `undefined++` results in `NaN`
4. `console.log(x)` outputs `NaN`
5. The assignment `x = 21` happens after the log

**Key concept:** Variable declarations are hoisted but not their assignments. The local `x` in `random` shadows the outer `x`.

</details>

---

### 26. `typeof` operator results

```javascript
console.log(typeof [1, 2, 3, 4]);
console.log(typeof null);
console.log(typeof NaN);
console.log(typeof 1234n);
console.log(typeof 3.14);
console.log(typeof Symbol());
console.log(typeof "John");
console.log(typeof 33);
console.log(typeof true);
console.log(typeof undefined);
```

<details>
<summary><b>Answer</b></summary>

**Output:**
- `"object"` (arrays are objects)
- `"object"` (historical bug in JavaScript)
- `"number"` (NaN is technically a number type)
- `"bigint"`
- `"number"`
- `"symbol"`
- `"string"`
- `"number"`
- `"boolean"`
- `"undefined"`

**Key notes:**
- `typeof null` returning `"object"` is a well-known JavaScript quirk
- `NaN` (Not-a-Number) paradoxically has type `"number"`
- Arrays return `"object"` - use `Array.isArray()` to check for arrays

</details>

---

### 27. XSS vulnerability with `innerHTML`

```javascript
const data = await fetch("api");
const div = document.getElementById("todo");
div.innerHTML = data;
```

<details>
<summary><b>Answer</b></summary>

**Security Issue:** Cross-Site Scripting (XSS) vulnerability

**Explanation:**

- Directly assigning untrusted data to `innerHTML` can execute malicious scripts
- If the API returns `<script>alert('XSS')</script>`, it will execute
- This allows attackers to inject and run arbitrary JavaScript

**Safer alternatives:**

```javascript
// Option 1: Use textContent (no HTML parsing)
div.textContent = data;

// Option 2: Sanitize with DOMPurify
div.innerHTML = DOMPurify.sanitize(data);

// Option 3: Create elements programmatically
const textNode = document.createTextNode(data);
div.appendChild(textNode);
```

**Key concept:** Never trust external data. Always sanitize or escape content before inserting into the DOM.

</details>

---

### 28. `typeof typeof`

```javascript
console.log(typeof typeof 1);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `"string"`

**Explanation:**

1. `typeof 1` evaluates first → returns `"number"` (a string)
2. `typeof "number"` evaluates next → returns `"string"`

**Key concept:** The `typeof` operator always returns a string representing the type.

</details>

---

### 29. Hoisting with post-increment

```javascript
x++;
console.log(x);
var x = 21;
```

<details>
<summary><b>Answer</b></summary>

**Output:** `NaN`

**Explanation:**

Due to hoisting:

```javascript
var x; // hoisted, initialized as undefined
x++;   // undefined++ = NaN
console.log(x); // NaN
x = 21;
```

1. `var x` is hoisted and initialized as `undefined`
2. `x++` attempts to increment `undefined`
3. JavaScript coerces `undefined` to `NaN` in numeric context
4. `NaN++` results in `NaN`
5. `console.log(x)` outputs `NaN`

</details>

---

### 30. Array addition and type coercion

```javascript
const x = [1];
const y = [2];
console.log(x + y);
```

<details>
<summary><b>Answer</b></summary>

**Output:** `"12"`

**Explanation:**

1. The `+` operator with arrays triggers type coercion
2. Arrays are converted to strings using `.toString()`:
   - `[1].toString()` → `"1"`
   - `[2].toString()` → `"2"`
3. String concatenation: `"1" + "2"` → `"12"`

**Key concept:** The `+` operator with arrays performs string concatenation, not array concatenation.

</details>

---

###### 31. What's the output?

```javascript
const x = [1];
const y = [2];
console.log(x + y);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"12"`

When you use the `+` operator with arrays in JavaScript, it performs string concatenation, not array concatenation.

JavaScript implicitly converts both arrays to strings:
- `[1]` becomes `"1"`
- `[2]` becomes `"2"`

Then it concatenates them: `"1" + "2" = "12"`

**Key Point:** The `+` operator does not perform array concatenation in JavaScript. When used with arrays, it converts them to strings first.

</p>
</details>

---

###### 32. What's the output?

```javascript
const data = {
  name: "sai",
  name: "krishna"
}
console.log(data.name);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"krishna"`

In JavaScript, if an object has multiple properties with the same name, the last one defined will overwrite the previous ones.

Object properties are treated as key-value pairs where keys must be unique. When you define the same key multiple times, each subsequent definition replaces the previous value.

</p>
</details>

---

###### 33. What's the output?

```javascript
let x = 10 + 2 * 3
console.log(x);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `16`

The expression is evaluated according to operator precedence rules. Multiplication (`*`) has higher precedence than addition (`+`).

Evaluation order:
1. First: `2 * 3 = 6`
2. Then: `10 + 6 = 16`

</p>
</details>

---

###### 34. What's the output?

```javascript
const x = [1, 2, 3];
const y = [1, 3, 4];
console.log(x + y);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"1,2,31,3,4"`

When you use the `+` operator with arrays, JavaScript converts each array to a string by calling `toString()`:
- `x.toString()` becomes `"1,2,3"`
- `y.toString()` becomes `"1,3,4"`

Then the `+` operator concatenates these strings: `"1,2,3" + "1,3,4" = "1,2,31,3,4"`

</p>
</details>

---

###### 35. What's the output?

```javascript
console.log(+true);
console.log(!"sai");
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `1` and `false`

**First line:** `console.log(+true);`
- The unary plus operator (`+`) converts its operand to a number
- `true` converts to `1`

**Second line:** `console.log(!"sai");`
- The logical NOT operator (`!`) converts its operand to boolean and negates it
- `"sai"` is a non-empty string (truthy value)
- Negating a truthy value results in `false`

</p>
</details>

---

###### 36. What's the output?

```javascript
console.log([] + []);
console.log([1] + []);
console.log([1] + "abc");
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `""`, `"1"`, `"1abc"`

When you use the `+` operator with arrays, JavaScript converts them to strings using `toString()`:

1. `[] + []`: Empty arrays convert to empty strings → `"" + "" = ""`
2. `[1] + []`: `[1]` becomes `"1"`, `[]` becomes `""` → `"1" + "" = "1"`
3. `[1] + "abc"`: `[1]` becomes `"1"` → `"1" + "abc" = "1abc"`

</p>
</details>

---

###### 37. What's the output?

```javascript
function getAge(...args) {
  console.log(typeof args)
}
getAge(21)
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"object"`

The `...args` rest parameter syntax collects all arguments into an array. Even though you pass `21`, `args` becomes `[21]`.

In JavaScript, arrays are technically a type of object. When you use `typeof` on an array, it returns `"object"`, not `"array"`.

</p>
</details>

---

###### 38. What's the output?

```javascript
const obj = {
  a: "one",
  b: "two",
  a: "three"
}
console.log(obj);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `{ a: "three", b: "two" }`

When an object has duplicate keys, the last occurrence overwrites previous values. This happens silently without any error.

The key `a` is first assigned `"one"`, then redefined with `"three"` (overwriting the first value). The key `b` stays `"two"`.

</p>
</details>

---

###### 39. What's the output?

```javascript
var z = 1, y = z = typeof y;
console.log(y);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"undefined"`

Due to variable hoisting with `var`, both `z` and `y` are declared but initialized to `undefined` before the assignment.

Evaluation (right-to-left):
1. `typeof y` evaluates first → `"undefined"` (because `y` is hoisted but not yet assigned)
2. `z = "undefined"` (overwrites the initial value of `1`)
3. `y = "undefined"`

**Key points:**
- Variables declared with `var` are hoisted and initialized to `undefined`
- Assignment is evaluated right-to-left: `a = b = c` means `b = c` first, then `a = b`

</p>
</details>

---

###### 40. What's the output?

```javascript
console.log(false || null || "Hello");
console.log(false && null && "Hello");
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"Hello"` and `false`

**First line:** `false || null || "Hello"`
- Logical OR (`||`) returns the first truthy value
- `false` → falsy, check next
- `null` → falsy, check next
- `"Hello"` → truthy, return `"Hello"`

**Second line:** `false && null && "Hello"`
- Logical AND (`&&`) returns the first falsy value
- `false` → falsy, return `false` immediately

**Key rules:**
- `||` (OR): Stops at the first truthy value
- `&&` (AND): Stops at the first falsy value

</p>
</details>

---

###### 41. What's the output?

```javascript
const numbers = [1, 2, 3, 4, 5];
const [x, ...y] = numbers;
console.log(x, y);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `1 [2, 3, 4, 5]`

This is array destructuring with the rest operator:
- `x` is assigned the first element (`1`)
- `...y` uses the rest operator to collect remaining elements into a new array

Result:
- `x` → `1`
- `y` → `[2, 3, 4, 5]`

**Note:** The rest operator (`...`) must always be the last element in destructuring.

</p>
</details>

---

###### 42. What's the output?

```javascript
const str = "abc" + + "def";
console.log(str);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `"abcNaN"`

Breaking down `"abc" + + "def"`:
- The first `+` is the string concatenation operator
- The second `+` is the unary plus operator (converts to number)

Evaluation:
1. `+ "def"` tries to convert `"def"` to a number → results in `NaN`
2. `"abc" + NaN` → JavaScript converts `NaN` to string `"NaN"`
3. Final result: `"abc" + "NaN" = "abcNaN"`

**Key takeaway:** The unary `+` operator converts values to numbers. Invalid conversions produce `NaN`.

</p>
</details>

---

###### 43. What's the output?

```javascript
let newlist = [1].push(2);
console.log(newlist.push(3));
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `TypeError: newlist.push is not a function`

The `push()` method returns the **new length** of the array, not the array itself.

1. `[1].push(2)` adds `2` to the array, making it `[1, 2]`, but returns `2` (the new length)
2. `newlist` is now `2` (a number)
3. Attempting `newlist.push(3)` fails because numbers don't have a `push()` method

**Key takeaway:** Always remember that `push()` returns the array's length, not the array.

</p>
</details>

---

###### 44. What's the output?

```javascript
console.log(0 || 1);
console.log(1 || 2);
console.log(0 && 1);
console.log(1 && 2);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `1`, `1`, `0`, `2`

**Logical OR (`||`):**
- `0 || 1` → `0` is falsy, return first truthy value → `1`
- `1 || 2` → `1` is truthy, return it immediately → `1`

**Logical AND (`&&`):**
- `0 && 1` → `0` is falsy, return it immediately → `0`
- `1 && 2` → Both truthy, return last value → `2`

**Rules:**
- `||`: Returns first truthy value (or last value if all falsy)
- `&&`: Returns first falsy value (or last value if all truthy)

</p>
</details>

---

###### 45. What's the output?

```javascript
console.log(data());
var data = function() {
  return "1";
}
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `TypeError: data is not a function`

Due to hoisting, the declaration of `data` is hoisted to the top, but its initialization is not.

At the time of `console.log(data())`:
- `data` exists (hoisted) but equals `undefined`
- Calling `undefined()` throws a TypeError

**Comparison:**
- **Function expression** (`var data = function(){}`): Only the variable declaration is hoisted
- **Function declaration** (`function data(){}`): The entire function is hoisted and callable

</p>
</details>

---

###### 46. What's the output?

```javascript
const arr = [1, 2, 3];
arr[5] = 6;
console.log(arr.length);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `6`

JavaScript arrays are dynamic. When you assign to index `5`:
- The array expands to accommodate it
- Indexes `3` and `4` become empty slots
- The array becomes: `[1, 2, 3, empty, empty, 6]`

The `length` property equals the highest index + 1: `5 + 1 = 6`

**Key takeaway:** Empty slots are not the same as `undefined` – they are gaps in the array.

</p>
</details>

---

###### 47. What's the output?

```javascript
const obj = {
  a: 1
}
obj.a = 2;
console.log(obj);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `{ a: 2 }`

The `const` keyword prevents reassigning the variable `obj` to a new object, but it doesn't prevent modifying the object's properties.

You can change `obj.a` from `1` to `2`, but you cannot do `obj = {}` (reassignment).

**Key takeaway:** `const` protects the variable reference, not the object's contents.

</p>
</details>

---

###### 48. What's the output?

```javascript
let x = {
  a: undefined,
  b: null
}
console.log(JSON.stringify(x))
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `{"b":null}`

`JSON.stringify()` has specific rules:
- Properties with `undefined` values are **excluded** from the output
- `null` is a valid JSON value and is **included**

Result: Only property `b` (with value `null`) appears in the JSON string.

</p>
</details>

---

###### 49. What's the output?

```javascript
console.log(true + 1);
console.log(true + "1");
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `2` and `"true1"`

**First line:** `true + 1`
- Boolean converts to number: `true` → `1`
- Addition: `1 + 1 = 2`

**Second line:** `true + "1"`
- When `+` is used with a string, everything converts to strings
- `true` → `"true"`
- Concatenation: `"true" + "1" = "true1"`

**Rules:**
- `+` with numbers: Booleans convert to numbers (`true` → `1`, `false` → `0`)
- `+` with strings: All values convert to strings and concatenate

</p>
</details>

---

###### 50. What's the output?

```javascript
const str = "hello";
str.data = "val";
console.log(str.data);
```

<details><summary><b>Answer</b></summary>
<p>

#### Answer: `undefined`

Primitive strings (like `"hello"`) cannot have properties added to them.

What happens:
1. When you write `str.data = "val"`, JavaScript temporarily converts the primitive to a String object
2. The property is added to this temporary object
3. The temporary object is immediately discarded
4. When you access `str.data`, a new temporary object is created (without the `data` property)
5. Result: `undefined`

**Key takeaway:** Primitives (strings, numbers, booleans) cannot hold custom properties. Use objects if you need to add properties.

</p>
</details>

---
