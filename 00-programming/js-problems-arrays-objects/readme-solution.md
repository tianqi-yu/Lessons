# JavaScript Problems

## Numbers & Strings

```js
var numbers = [1,12,4,18,9,7,11,3,101,5,6];
var strings = ['this','is','a','collection','of','words'];
```

### array.reduce - find the largest number

```js
var largestValue = numbers.reduce(function(x,y){ return x > y ? x : y });
console.log('largest number: ' + largestValue);
```

### array.reduce - find the longest string

```js
var longest = strings.reduce(function(x,y){ return x.length > y.length ? x : y});
console.log('longest word: ' + longest);
```

### array.filter - find all even numbers

```js
var evens = numbers.filter(function(x){ return x%2 === 0});
console.log('even numbers: ' + evens);
```

### array.filter - find all odd numbers

```js
var odds = numbers.filter(function(x){ return x%2 !== 0});
console.log('odds numbers: ' + odds);
```

### array.join - zip two arrays together (odds & evens)

```js
var joined = evens.concat(odds);
console.log('joined even and odd arrays: ' + joined);
```

### array.sort - sort the `joined` array from smallest to largest

```js
var sorted = joined.sort(function(l,r){ return l - r });
console.log('sorted array ' + sorted);
```

### array.map - return an array with all numbers cubed (x^3)

```js
var cubed = numbers.map(function(x) { return x * x * x });

console.log('cubed array: ' + cubed);
```

### array.every - assert that all numbers are divisible by 3

```js
var divisibleByThree = evens.every(function(n){ return n%3 === 0 };
console.log('All numbers divisible by three: ' + divisibleByThree);
```

### array.filter - find words that contain 'is'

```js
var wordsWithIs = strings.filter(function(x){ return x.indexOf('is') >= 0});
console.log('words containing is: ' + wordsWithIs);
```

### remove the last word from `strings`

```js
var lastWord = strings.pop();
console.log('popped word: ' + lastWord);
```

### put a new word "yeah" in the end of the array

```js
strings.push('yeah');
console.log('strings: ' + strings);
```

### remove the first word in the array

```js
var word = strings.shift();
console.log('removed from start: ' + word);
console.log('strings: ' + strings);
```

### place a new word "this" at the start of the array

```js
strings.unshift('this');
console.log('added to start: ' + 'this');
console.log('strings: ' + strings);
```

### grab a subset of elements, first 3 elements

```js
var sliced = strings.slice(0,3);
console.log('subset: '  + sliced);
console.log('strings: ' + strings);
```

### replace the first three elements, with `"test"` and `"123"`

```js
var x = strings.splice(0, 3, 'test', '123');
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

var result = customers
    .filter(function(c){ return c.firstname.indexOf('J') == 0 })
    .map(   function(c){ return { name : c.firstname + ' ' + c.lastname }})
    .sort(sortByName);

function sortByName(c1, c2) {
    if(c1.name < c2.name){
        return - 1
    } else if (c1.name > c2.name){
        return 1
    } else {
        return 0
    }
}

console.log(result);
```

Happy Coding!!