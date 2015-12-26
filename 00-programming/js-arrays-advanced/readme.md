## JavaScript Arrays

### JavaScript, The Good Parts

> An array is a linear allocation of memory in which elements are accessed by integers that are used to compute offsets. Arrays can be very fast data structures. Unfortunately, JavaScript does not have anything like this kind of array. Instead, JavaScript provides an object that has some array-like characteristics. It converts array subscripts into strings that are used to make properties. It is significantly slower than a real array, but it can be more convenient to use. Retrieval and updating of properties work the same as with objects, except that there is a special trick with integer property names. Arrays have their own literal format.
>
> Crockford, Douglas (2008-05-08). JavaScript: The Good Parts: The Good Parts . O'Reilly Media

### Introduction

- A way to store multiple pieces of data. Can also quickly determine how many items there are in the array.
- **Arrays preserve the order in which the data is stored**
- **Arrays are good for storing multiple values of the same kind.**
  - Although JS will allow you to store different data types in the same array
- Arrays always use `[ ]`

```js
// the two arrays below are NOT the same. Why?
var classmates1 = ['Jenny', 'Tom', 'Tony', 'Joe', 'Smith', 'Bob'];
var classmates2 = ['Jenny', 'Tom', 'Tony', 'Joe', 'Bob', 'Smith'];

// the two arrays below are the SAME.
var takeoutOrder = ['hamburger', 'fries', 'soda'];
var takeoutOrder = [
  'hamburger',
  'fries',
  'soda'
];

takeoutOrder.length; // returns 3
classmates1.length; // returns 6
```

#### Exercise Time!

- create arrays and think about what types of data are good for arrays
- Can you modify the length of an array directly? What happens if it's smaller? And if it's larger?
- Explain what will be the value of `myArray`

```js
var myArray = [1,2,3,4,5,6]
myArray[myArray.length] = 6;
```

## Arrays

### Defining Arrays

```js
  //-----------------------------------------------------------------------------
  // Arrays
  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
  //-----------------------------------------------------------------------------
  var hamburguer_simple = ['bun', 'veggie_pattie', 'tomato'];
  var hamburguer_full   = ['bun', 'veggie_pattie', 'tomato', 'lettuce', 'cheese'];
  var hotdog = new Array;
  var hotdog = [];
```

#### Accessing values in arrays

- You grab array values via their index. Indexes always start at **0** for the first item in the array.

```js
var classmates = ['Cassie', 'Clement', 'Dale', 'Dennis', 'Dow', 'Vivienne'];

classmates[1]; // will be the string 'Clement'
classmates[0]; // will be the string 'Cassie'
```

#### Deleting an element in an Array

There are two main ways to delete an element from an array:

1. Delete operator

```js
var classmates = ['Cassie', 'Clement', 'Dale', 'Dennis', 'Dow', 'Vivienne'];

delete classmates[1]
// => true

console.log(classmates);
// => ["Cassie", undefined, "Dale", "Dennis", "Dow", "Vivienne"]
```

2. Splice method

The [Array.prototype.splice](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) method changes the content of an array by removing existing elements and/or adding new elements.

> array.splice(start, deleteCount[, item1[, item2[, ...]]])
>
> PARAMETERS
>
> start: Index at which to start changing the array. If greater than the length of the array, actual starting index will be set to the length of the array. If negative, will begin that many elements from the end.
>
> deleteCount: An integer indicating the number of old array elements to remove. If deleteCount is 0, no elements are removed. In this case, you should specify at least one new element. If deleteCount is greater than the number of elements left in the array starting at start, then all of the elements through the end of the array will be deleted.
>
> itemN: The element to add to the array. If you don't specify any elements, splice() will only remove elements from the array.
>
> RETURNS
>
> An array containing the deleted elements. If only one element is removed, an array of one element is returned. If no elements are removed, an empty array is returned.

```js
var classmates = ['Cassie', 'Clement', 'Dale', 'Dennis', 'Dow', 'Vivienne'];

classmates.splice(1)
//=> ["Clement", "Dale", "Dennis", "Dow", "Vivienne"]

classmates
// => ["Cassie"]
```

### Useful Array Properties/Methods

#### isArray()

```js
  // Array.isArray(obj)
  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray

  console.log("Is hamburguer an array? " + Array.isArray(hamburguer_simple));
```

#### Array.length

```js
  // Array.length
  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length

  console.log("The simple Hamburguer has " + hamburguer_simple.length + " ingredients");
  console.log("The super Hamburguer has "  + hamburguer_full.length   + " ingredients");
```

#### Exploring Arrays keys/values

```js
  // Array.forEach()
  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach

  keysArray.forEach(function(element, index){
    console.log(element + " = " + index);
  })
```

### Manipulating Arrays

```js
  // Array.push
  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push

  hamburguer.push(tomato);
  hamburguer.push(lettuce);
  hamburguer.push(bun);


  // Array.unshift
  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift

  var extra_ingredient = hamburguer.shift();
  console.log("Removed ingredient: " + extra_ingredient)
```

# References

## Array Methods

### [Mutator Methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Mutator_methods)

- [Array.prototype.pop()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop)
- [Array.prototype.push()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push)
- [Array.prototype.shift()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift)
- [Array.prototype.unshift()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
- [Array.prototype.reverse()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse)
- [Array.prototype.sort()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)

### [Accessor Methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Accessor_methods)

| Method | Description |
|--------|-------------|
| `Array.prototype.concat()`         | Returns a new array comprised of this array joined with other array(s) and/or value(s).
| `Array.prototype.join()`           | Joins all elements of an array into a string.
| `Array.prototype.slice()`          | Extracts a section of an array and returns a new array.
| `Array.prototype.toString()`       | Returns a string representing the array and its elements.
| `Array.prototype.toLocaleString()` | Returns a localized string representing the array and its elements.
| `Array.prototype.indexOf()`        | Returns the first (least) index of an element within the array equal to the specified value, or -1 if none is found.
| `Array.prototype.lastIndexOf()`    | Returns the last (greatest) index of an element within the array equal to the specified value, or -1 if none is found.

### [Iteration Methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#Iteration_methods)

| Method | Description |
|--------|-------------|
| `Array.prototype.forEach()`     | Calls a function for each element in the array.
| `Array.prototype.every()`       | Returns true if every element in this array satisfies the provided testing function.
| `Array.prototype.some()`        | Returns true if at least one element in this array satisfies the provided testing function.
| `Array.prototype.filter()`      | Creates a new array with all of the elements of this array for which the provided filtering function returns true.
| `Array.prototype.keys()`        | Returns a new Array Iterator that contains the keys for each index in the array.
| `Array.prototype.reduce()`      | Apply a function against an accumulator and each value of the array (from left-to-right) as to reduce it to a single value.
| `Array.prototype.reduceRight()` | Apply a function against an accumulator and each value of the array (from right-to-left) as to reduce it to a single value.
| `Array.prototype.map()`         | Creates a new array with the results of calling a provided function on every element in this array.
