#### Simple Solution

```javascript
for (i = 1; i < 101; i++) {

  if((i % 3 === 0) && (i % 5 === 0)) {
    console.log("fizzbuzz");
  }
  else if(i % 3 === 0) {
    console.log("fizz");
  }
  else if(i % 5 === 0) {
    console.log("buzz");
  }
  else {
    console.log(i);
  }

}
```

#### Bonus Solution
```javascript
for (var i = 1; i < 101; i++) {
  var str = "";
  if (i%3 === 0) {
    str += "fizz";
  }
  if (i%5 === 0) {
    str += "buzz";
  }
  if (i%7 === 0){
    str += "tuzz";
  }
  if (i%9 === 0){
    str += "pizz";
  }
  console.log(i);
  if (str !== ""){
    console.log(str);
  }
}
```