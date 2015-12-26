# Assessment - Solution
## Week 7 | Day 3

- Using the JavaScript language, have the function tripleDouble(num1,num2) take both parameters being passed, and return 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
- For example: if num1 equals 451999277 and num2 equals 41177722899, then return 1 because in the first parameter you have the straight triple 999 and you have a straight double, 99, of the same number in the second parameter. If this isn't the case, return 0.

```js
var tripleDouble = function(num1, num2){
  num1Str = num1.toString();
  num2Str = num2.toString();

  if (num1Str.length < 3 || num2Str.length < 2) {
    return 0;
  }

  for (var i = 0; i < num1Str.length - 2; i++) {
    if (num1Str[i] == num1Str[i+1] && num1Str[i+1] == num1Str[i+2]) {
      for (var j = 0; j < num2Str.length - 1; j++) {
        if (num2Str[j] === num1Str[i] && num2Str[j+1] === num1Str[i]) {
          return 1;
        }
      }
    }
  }

  return 0;

};

console.log(tripleDouble(451999277, 41177722899)); // 1
console.log(tripleDouble(451927, 41623422345)); // 0
console.log(tripleDouble(44, 432)); // 0
console.log(tripleDouble(4444, 1)); // 0
```

Have fun!