# Advanced JavaScript

## First-Class Functions

In JavaScript, functions are first-class objects. This means that a function can be:

- [Expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function): The function declaration defines a function with the specified parameters.

>  function name([param,[, param,[..., param]]]) {
>    [statements]
>  }
>
>  function foo(a,b) { return a+b; }

- [Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/function): The function keyword can be used to define a function inside an expression

>  function [name]([param1[, param2[, ..., paramN]]]) {
>    statements
>  }
>
>  function foo(a,b) { return a+b; }

- [Global Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function)

>  new Function ([arg1[, arg2[, ...argN]],] functionBody)
>
>  var foo = new Function('a', 'b', 'return a+b')

We can easily pass them into functions *as if* they were variables.

```js
function add (first, second, callback) {
    console.log(first + second);
    callback();
}

function logDone() {
    console.log("I'm done!");
}

add(2, 3, logDone);
```

We can also literally define **functions as variables**:

```js
function add (first, second, callback) {
    console.log(first + second);
    callback();
}

var logDone = function() {
    console.log("I'm done!");
}

add(2, 3, logDone);
```

We can also define **anonymous functions**:

```js
function add (first, second, callback) {
    console.log(first + second);
    callback();
}

var logDone = function() {
    console.log("I'm done!");
}

add(2, 3, logDone);

add(6, 4, function() {
    console.log("Me too!");
})
```


**Note:** We can make the callback optional by just checking whether the callback parameter is passed to the function.

```js
function add (first, second, callback) {
    console.log(first + second);
    if (callback) {
        callback();
    }
}

add(2, 3, logDone);
add(7, 3);
```

## Event-Driven Environment

### $(document).ready()

As we know, JavaScript reads from top to bottom and it executes the code we write. So for example, when we use jQuery, we generally call the `$(document).ready()` function and we pass an anonymous function to it.

```js
$(document).ready(
  function(){ ... }
);
```

This is trivial yet it maybe raises not so obvious questions:

- If JS reads top to bottom, when does that function get executed?
- Where is that function until it gets executed?

### Event-Driven Architecture

Now, let's add a bit more to our example. Let's create an event listener on a button element, that alerts a number when it's clicked:

```js
$(document).ready(function(){

    $('button').on('click', function() {
        var a = 1;
        alert(a);
    });

});
```

There is an extensive list of events we can access through the [jQuery events](https://api.jquery.com/category/events/) *(MouseEnter, resize, keyUp, click, scroll, etc etc)*.

We can listen to any event and pass it a `callback function` that will only get executed when that event is triggered. So... who is responsible for checking whether an event has been fired?

JavaScript runs in the browser thanks to the [V8 JavaScript engine](https://code.google.com/p/v8/), and one of the design principles of Node is an [event-driven architecture](https://en.wikipedia.org/wiki/Event-driven_architecture)

![](http://www.qidiantong.com/uploads/allimg/141113/220Q2DT-2.PNG)

## Closures

[MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures) defines closures as **functions that refer to independent (free) variables. In other words, the function defined in the closure 'remembers' the environment in which it was created.**

Closures are functions that retain `state` and `scope` after it's been executed.

```js
$(function() {

    // Define variable in anonymous function
    var a = 1;

    $('button').on('click', function() {
        // Can we access this variable?
        alert(a);
    });

});
```

It's interesting to notice that the callback function binded to the event listener can still access the variable `a`, eventhough the inner function doesn't have `a` declared in it's scope.

Also, the inner function (callback) can run long after the outer function has finished. So how does it know the value of `a`?

### References

Let's think together. In the next example, we increase the variable `a` in the inner function... but the outer function has finished by the time we click the button... how can we increase the value of `a` when the original reference has already finished execution?

```js
$(function() {

    // Define variable in anonymous function
    var a = 1;

    $('button').on('click', function() {
        a++;
        alert(a);
    });

});
```

JavaScript keeps track of what variables may be needed in the future, and keeps a reference for us so we can access the variable later.

If you are interested in how javascript manages memory, there is a comprehensive [MDN article](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management) that describes js `Memory life-cycle`, how does it implement `Garbage Collection`, and lots of fun stuff.

JS needs to keep the callback function in memory in case an event gets triggered. This means that we may run into memory issues as we accumulate event handlers.

A quick way to solve this is by calling jQuery's `.off()` method, which will remove the function from the event-loop, freeing memory and unbinding the function.

```js
$(function() {

    // Define variable in anonymous function
    var a = 1;

    $('button').on('click', function() {
        a++;
        alert(a);
    });

    $('button').off("click");
});
```

## Scope

### Introduction

To work with JavaScript efficiently, one of the first things you need to understand is the concept of `variable scope`.

The scope of a variable is controlled by the location of the variable declaration, and defines the part of the program where a particular variable is accessible.

JavaScript has two scopes – **global** and **local**.

### Global Scope

Any variable declared outside of a function belongs to the `global scope`, and is therefore accessible from anywhere in your code.

When we run JS in the browser, the most outer scope it's the `window` object.

```js
var a = 1;
console.log(window.a === 1);
```

### Local Scope

Each function has its own scope, and any variable declared within that function is only accessible from that function and any nested functions. This is called [Lexical Scoping](https://en.wikipedia.org/wiki/Scope_(computer_science)#Lexical_scoping).

When we declare a function inside another function, then we create nested scope.

Now... Let's define a function and try to access the outer variable from that function, and we try to access the inner variable from the global scope.

Here we can see how inner functions can access outer variables (`outerVar`), but outer functions cannot access inner variables (`innerVar`).

```js
var outerVar = 1;

function inner() {
    var innerVar = 2;
    console.log(outerVar);
}

console.log(innerVar);
```

If we want to access the outer variable, we need to access the scope of the parent object that holds that variable. For example, in our above example, we could access it by using `window.a`.

```js
var a = 1;

function inner() {
    var a = 2;
    console.log(a);
    console.log(window.a);
}

inner();
console.log(a);
```

### Shadowing

In computer programming, [variable shadowing](https://en.wikipedia.org/wiki/Variable_shadowing) occurs when a variable declared within a certain scope has the same name as a variable declared in an outer scope:

```js
var a = 1;
var b = 2;

function inner() {
        a = 4;    // not using `var` | Shadowing global variable
    var b = 3;    // using 'var'
}

inner();
console.log(a);
console.log(b);
```

> Note – In **strict mode** (`"use strict";`) it is an error, if you assign value to variable without first declaring the variable. Perhaps a good idea for those who tend to forget using `var`.

When JavaScript sees a reference to a variable, it will try to find the variable declaration within the same scope it's been referenced. If it cannot find that declaration, it will look for it within the parent scope. If it cannot find it there, it will look for the grand-parent scope... and will keep trying until it reaches the `global scope`.

### Hoisting

A JavaScript interpreter performs many things behind the scene, and one of them is called `hoisting`. Functions and variables, rather than being available after their declaration, they might actually be available beforehand.

#### Variable Hoisting

We know what happens if we try to reference a variable that hasn't been defined previously:

```js
// ReferenceError: noSuchVariable is not defined
console.log(noSuchVariable);
```

Easy. Now, something you may not know is that JavaScript treats variables which will be *declared later* on in a function differently than variables that are *not declared at all*.

```js
console.log(declaredLater);  // undefined

var declaredLater = 2;

console.log(declaredLater); // 2
```

Basically, the JavaScript interpreter "looks ahead" to find all the variable declarations and "hoists" them to the top of the function:

```js
var declaredLater;
console.log(declaredLater);

declaredLater = 2;

console.log(declaredLater);
```

This behavior means in practical terms that we need to be *very careful* when we reuse variable names between inner and outer scope.

```js
var name = "Fer";

(function () {
    console.log("Original name was " + name);

    var name = "Harry";

    console.log("New name is " + name);
})();
```

```js
var a = 1;

function foo(){
  var a = 2;
  console.log(a);
}

function bar(){
  a = 3;
  console.log(a);
}

foo();
bar();
console.log(a);
```


#### Function Hoisting

The same logic applies to functions. The JavaScript interpreter allows you to use the function before the point at which it was declared in the source code.

```js
isItHoisted(); // Yes!

function isItHoisted() {
    console.log("Yes!");
}
```

However, function definition hoisting only occurs for **function declarations**, not **function expressions**. For example:

```js
definitionHoisted();    // Outputs: "Definition hoisted!"
definitionNotHoisted(); // TypeError: undefined is not a function

function definitionHoisted() {
    console.log("Definition hoisted!");
}

var definitionNotHoisted = function () {
    console.log("Definition not hoisted!");
};
```

### Immediately-invoked function expression

[IIFE](https://en.wikipedia.org/wiki/Immediately-invoked_function_expression)  is a JavaScript design pattern which produces a lexical scope using JavaScript's function scoping.

Immediately-invoked function expressions can be used to:
- avoid variable hoisting from within blocks
- protect against polluting the global environment and
- simultaneously allow public access to methods while retaining privacy for variables defined within the function

```js
(function() {
  // the code here is executed once in its own scope
}());
```

Passing variables into the scope is done as follows:

```js
(function(a, b) {
  // a == 'hello'
  // b == 'world'
}('hello', 'world'));
```

## Context

Context refers to the value of `this` for the code that is running.

> CONTEXT == THIS

### Global Context

When we are in the global scope, `this` is always a reference to the `window` object:

```js
var a = 1;

console.log(this);           // Window object
console.log(this == window); // true

console.log(window.a);       // 1
console.log(this.a);         // 1
console.log(a);              // 1
```

If we declare a function, it will create a new `scope`, but the `context` in which that function runs will still be the same. By default, a function always runs in the scope of the object it belongs to:

```js
function foo(){
  console.log(this);         // Window object
}

foo();
```

### JavaScript Function Internals

JavaScript has the ability to modularize logic in functions which can be invoked at any point within the execution.

Invoking a function is pretty easy, but what does exactly happens when we call a function? Javascript follows this steps:

- suspends execution of the current function
- Passes controls to the invoked function
- Passes (secretly) two parameters to the invoked function:
  - An array named `arguments`
  - A parameter named `this`

```js
function fer(a,b) {
  console.log(arguments); // ['hi', 2, 8]
}
fer('hi', 2, 3+5);
```

Even though there are is only one invocation operator `()`, there are **four invocation patterns**. Each pattern differs in how the `this` parameter is initialized. Invoking a function with a different pattern can produce a vastly different result.

### Method Invocation

When a function is part of an object, it is called a method. Method invocation is the pattern of invoking a function that is part of an object. For example:

```js
var obj = {
    value: 0,
    increment: function() { this.value++; }   // this == obj
};

obj.increment();
```

**Method invocation** can be easily identified when a function is preceded by `object.`, where `object` is the name of some object. **JavaScript will set the `this` parameter to the object where the method was invoked on**.  JavaScript binds this at [runtime](https://en.wikipedia.org/wiki/Run_time_(program_lifecycle_phase)) (also known as [late binding](https://en.wikipedia.org/wiki/Late_binding)).

### Function Invocation

When we call a function *normally*, we are using the **function invocation pattern**, and JavaScript will bind the value of `this` to the `global object`.

What would the following code do?

```js
var value = 500;
var obj = {
    value: 0,
    increment: function() {
        this.value++;

        var innerFunction = function() {
            console.log(this.value);
        }

        innerFunction(); // Function invocation pattern
    }
}
obj.increment(); // Method invocation pattern
```

The real answer is `500`, not `1`. Note that `innerFunction` is called using the **function invocation pattern**, therefore this is set to the `global object`. The result is that innerFunction  will not have `this` set to the `current object`. Instead, it is set to the `global object`, where `value` is defined as `500`.

If we really want to have `innerFunction` access the context of it's parent, we may want to keep state in the closure by storing `that` as the previous `this`.

```js
var value = 500;
var obj = {
    value: 0,
    increment: function() {
        var that = this;
        that.value++;

        var innerFunction = function() {
            console.log(that.value);
        }

        innerFunction(); // Function invocation pattern
    }
}
obj.increment();
```

### Constructor Invocation

In classical [object oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming), an object is an instantiation of a class. In `C++` and `Java`, this instantiation is performed by using the `new` operator.

The **constructor invocation pattern** involves putting the `new` operator just before the function is invoked. For example:

```js
var Cheese = function(typeOfCheese) {
    var cheeseType = typeOfCheese;
    return cheeseType;
}

cheddar = new Cheese("cheddar"); // new object returned, not the type.
```

Even though `Cheese` is a function object (and intuitively, one thinks of functions as running modularized pieces of code), we have created a new object by invoking the function with `new` in front of it.

**The `this` parameter will be set to the newly created object** and the `return` operator of the function will have its behavior altered.


### `Apply` And `Call` Invocation

Because JavaScript is a functional object-oriented language, functions can also have methods.

#### `Apply` Method

The [apply method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) allows manual invocation of a function.

Apply is a hidden method of every function, so we call it by adding `.apply()` to the function itself and it takes two parameters:

- An object to bind the `this` parameter to
- An array which is mapped to the parameters

```js
var obj = {
  foo: function(a, b, c) {
    console.log( arguments );
    console.log( this );
  }
};

obj.foo(1,2,3);
// ==> [1,2.3]
// ==> obj {}

obj.foo.apply(window, [1,2,3]);
// ==> [1,2.3]
// ==> window {}
```

> **Note:** `arguments` is an *array like* object, which has the `length` property and no other array methods we can use. This probably came as a decision to make the language faster as EVERY function call will implicitly have `arguments` available.

#### `Call` Method

JavaScript also has another invoker called [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call), that is identical to `apply` except that **instead of taking an array of parameters, it takes an argument list**.

```js
var fer   = {name: 'Fer',   coder: true};
var harry = {name: 'Harry', coder: true};

var hi = function(){
    console.log('Whatsup, ' + this.name);
};

var bye = function(){
    console.log('Laters, ' + this.name);
};

hi();   // Error

hi.call(fer);
bye.call(harry);
```

All four of these lines do exactly the same thing. The run `hi` or `bye` in the scope of either `fer` or `harry`.


```js
var fer   = {name: 'Fer',   coder: true, nationality: 'Mexican'};
var harry = {name: 'Harry', coder: true, nationality: 'Taiwanese'};

var update = function(name, coder, nationality){
    this.name = name;
    this.coder = coder;
    this.nationality = nationality;
};

update.call(fer, 'Fer', true, 'Spanish');
update.apply(harry, ['Harry', true, 'Canadian']);
```


#### `Apply` Vs `Call`

```
Function.call(this, param1, param2, param 3,... )
Function.apply(this, [param1, param2, param 3, ...]
```

The limitations of `call` quickly become apparent when you want to write code that doesn't know the number of arguments that the functions need.

```js
var addGrades_CALL = function(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10) {
    console.log(arguments); // ==> [1,2,3,4,5,6,7,8,9,10]
    var sum = 0;
    for (var i=0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

addGrades_CALL.call(null, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
```

In the case of `apply`, passing an array as a parameter will allow us to iterate through all the parameters easily

```js
var grades1 = [1,2,3,4,5];
var grades2 = [1,2,3,4,5,6,7,8,9,10];

var addGrades_APPLY = function() {
    console.log(arguments);
    var sum = 0;
    for (var i=0; i < arguments[1].length; i++) {
        sum += arguments[1][i];
    }
    return sum;
}

addGrades_APPLY(null, grades1);
addGrades_APPLY(null, grades2);
```

### `Bind`

[Bind](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_objects/Function/bind) creates a new function that, when called, has its this keyword set to the provided value, with a given sequence of arguments preceding any provided when the new function is called.

```js
var obj = {
  foo: function() {
    console.log( this );
  }
};

var bindFoo = obj.foo.bind(window);

obj.foo(); // ==> obj
bindFoo(); // ==> window
```