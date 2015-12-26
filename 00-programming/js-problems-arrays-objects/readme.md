# JavaScript Problems

## Numbers & Strings

```js
var numbers = [1,12,4,18,9,7,11,3,101,5,6];
var strings = ['this','is','a','collection','of','words'];
```

### array.reduce - find the largest number

```js
var largestValue = ___;
console.log('largest number: ' + largestValue);
```

### array.reduce - find the longest string

```js
var longest = ___;
console.log('longest word: ' + longest);
```

### array.filter - find all even numbers

```js
var evens = ___;
console.log('even numbers: ' + evens);
```

### array.filter - find all odd numbers

```js
var odds = ___;
console.log('odds numbers: ' + odds);
```

### array .filter - find words that contain 'is'

```js
var wordsWithIs = ___;
console.log('words containing is: ' + wordsWithIs);
```

### array.map - return an array with all numbers squared (x^2)

```js
var squared = ___;

console.log('squared array: ' + squared);
```

### array.every - assert that all numbers are divisible by 3

```js
var divisibleByThree = ___;
console.log('All numbers divisible by three: ' + divisibleByThree);
```

### array.join - zip two arrays together

```js
var joined = ___;
console.log('joined even and odd arrays: ' + joined);
```

### array.sort - sort the `joined` array from smallest to largest

```js
var sorted = ___;
console.log('sorted array ' + sorted);
```

### remove the last word from `strings`

```js
var lastWord = ___;
console.log('popped word: ' + lastWord);
```

### put a new word "yeah" in the array

```js
___;
console.log('strings: ' + strings);
```

### remove the first word in the array

```js
var word = ___;
console.log('removed from start: ' + word);
console.log('strings: ' + strings);
```

### place a new word "this" at the start of the array

```js
___;
console.log('added to start: ' + 'this');
console.log('strings: ' + strings);
```

### grab a subset of elements, first 3 elements

```js
var sliced = ___;;
console.log('subset: '  + sliced);
console.log('strings: ' + strings);
```

### replace the first three elements, with `"test"` and `"123"`

```js
var x = ___;
console.log('removed: ' + x + ' and replaced with test, 123');
console.log(strings);
```

## Customers

Given the following array, return an array that:
- contains only customers whose firstname starts with 'J',
- where objects have a unique key `name` that combines the firstname and lastname,
- and sorted alphabetically

```js
var customers = [
    { firstname : 'Joe',  lastname : 'Blogs'},
    { firstname : 'John', lastname : 'Smith'},
    { firstname : 'Dave', lastname : 'Jones'},
    { firstname : 'Jack', lastname : 'White'}
];

var result = [
    { name : 'Jack White'},
    { name : 'Joe Blogs'},
    { name : 'John Smith'}
];
```

Happy Coding!!