## w02d1

1. What is DOM?

DOM ([Document Object Model](https://en.wikipedia.org/wiki/Document_Object_Model)) is a language that helps us represent HTML documents in a tree-like structure.

1. Why do we need it?

DOM help javascript interact with HTML so we can manipulate it's elements in a consistent way.

1. What is the major difference between `document.getElementsByClassName("some-class")` and `document.getElementById("some-id")` in terms of what it returns?

- [getElementsByClassName](https://developer.mozilla.org/en/docs/Web/API/Document/getElementsByClassName) return a [HTMLCollection](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection), which is a javascript *array-like* object that represents a collection of HTML elements that have a particular `class`.
- [getElementById](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById) returns an individual [element](https://developer.mozilla.org/en-US/docs/Web/API/element) if it can be found, or `null` if there is no element with that particular `id`

1. Answer the following questions using this HTML
```html
  <body>
    <div>
      <ul>
        <li class="item">a</li>
        <li class="item">b</li>
        <li class="item">c</li>
        <li class="item">d</li>
        <li class="item">e</li>
      </ul>
    </div>
  </body>
```
  1. How do we target all the `<li>`?

```js
var elements = document.getElementsByTagName('li')
```

  1. How do we target even `<li>`s? (b,d)

```js
// the easiest way would be to use pseudo-selectors with jQuery
// https://api.jquery.com/even-selector/
var even_elements = $('li:even')

// alternatively, we can always get all the elements and loop
var elements = document.getElementsByTagName('li');
var even = [];

for (var i = 1; i < elements.length; i = i+2) {
  even.push(elements[i])
}
```

  1. How do we give each `<li>` an attribute call "my-value" that contain the innerHTML as it's value?

```js
var elements = document.getElementsByTagName('li')

for (var i = 0 ; i < elements.length; i++) {
  elements[i].setAttribute('my-value', elements[i].innerHTML)
}
```

  1. Add a button with an event listener when clicked to each `<li>` to console.log it's attribute "my-value's" value.

```js
var elements = document.getElementsByTagName('li');

function listener(event) {
  console.log(this.parentElement.getAttribute('my-value'));
}

for (var i=0; i < elements.length; i++) {
  var btn = document.createElement("button");
  var text = document.createTextNode("click me");
  btn.appendChild(text);
  btn.addEventListener("click", listener)
  elements[i].appendChild(btn);
}
```

> Note: Refer solution to [w02d1-solution.html](/14-assessments/w02d1-solution.html)

1. How do we change google's "I'm Feeling Lucky" to "I am Feeling Awesome" with javascript? (test it in the chrome developers tool console!)

```js
var elem = document.getElementsByName('btnI');
elem[0].setAttribute('value', 'I\'m Feeling Awesome');
```

1. What's the difference between `==` and `===` in javascript? Please provide an example in which they return different values?

[MDN | Comparison Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)

The identity operator (`===`) will return true if the operands are strictly equal, without doing a type conversion:

```js
3 == '3'     // true
3 === '3'    // false
```

1. Imagine we need to store all students and grades for the morning assessment in javascript. What would be a good data structure to store this information? Please justify your answer

```js
// First option, correlation by position
var grades = [5,7,8,6,9,7,6,8,6];
var names  = ['Ada Au', 'Ian Choo', 'Andrew Alekseev', 'Charlotte Kwan', 'Jacky Lee', 'Toni Anne Romero', 'Frances Ng', 'Pip Johnstone', 'Bryan Fong', 'Ian Kwok'];

// Second option, creating objects for students
var grades = [
  {'Ada Au' : 7},
  {'Ian Choo' : 7},
  {'Andrew Alekseev' : 7},
  {'Charlotte Kwan' : 7},
  {'Jacky Lee' : 7},
  {'Toni Anne Romero' : 7},
  {'Frances Ng' : 7},
  {'Pip Johnstone' : 7},
  {'Bryan Fong' : 7},
  {'Ian Kwok' : 7},
];

// Third option, array where students are keys
var grades = {
   'Ada Au' : 7,
   'Ian Choo' : 7,
   'Andrew Alekseev' : 7,
   'Charlotte Kwan' : 7,
   'Jacky Lee' : 7,
   'Toni Anne Romero' : 7,
   'Frances Ng' : 7,
   'Pip Johnstone' : 7,
   'Bryan Fong' : 7,
   'Ian Kwok' : 7,
};
```
