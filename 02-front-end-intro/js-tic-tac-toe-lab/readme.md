---
title: Tic Tac Toe Lab
type: lab
duration: "8"
creator:
    name: Micah Rich
    city: LA
competencies: Programming, HTM and CSS
---

# Tic Tac Toe Javascript

## Introduction

This week, we have been learning about writing functions, working with
loops, and writing conditionals. We also learned about how HTML elements are styled and behave in the DOM.

For this lab, you'll be building a tic tac toe game in HTML, CSS, and pure JavaScript.

## Exercise

#### Requirements

- A user should be able to click on different squares to make a move
- Every click will alternate between marking an `X` and `O`
- Upon marking of an individual cell, use JavaScript to add a class to
  each cell to display separate colors
- A cell should not be able to be replayed once marked
- Add a reset button that will clear the contents of the board

---

- Since this is our first extended lab, here are some __tips/hints__ to get started:

 - Construct a `index.html` to be your starting point on this
 project. Add your necessary HTML tags, including `script` and
 `link` tags to link to your JavaScript and CSS, respectively.

 - Before you even start working with JavaScript, construct the
 gameboard. The gameboard page should include the 3x3 grid and at
 minimum, a reset button. Using `id` and `class` on clickable
 elements will help you wire this up in JavaScript afterwards.

 - JavaScript portion will be next:

   * Locate the element first to use it within your app. Think about
      using `document.getElementById`, `document.getElementsByClassName` or something similar to locate your target elements. Try this in your console to make sure your selection works.

   * After finding the elements, start writing logic to listen for
      `click` events on those elements

   * You will also need a variable to keep track of moves - this
      will be used to indicate whether or not to draw an `X` or an `O`.

**Bonus:**
- Display a message to indicate which turn is about to be played
- After the necessary moves have been played, stop the game and alert the
  winner if one player ends up winning with three in a row
    * Hint: Determine a set of winning combinations. Check those
      combinations on the board contents after every move.


#### Starter code

There is no starter code provided for this lab.

#### Deliverable

Please find some screenshots of what you'll be creating.  Feel free to get creative with how you style your interface.

![Screen-shot](https://i.imgur.com/kz2L9f9.png)
![Screen-shot](https://i.imgur.com/d8lFshD.png)
![Screen-shot](https://i.imgur.com/Jw6hhcA.png)

#### Additional Resources

- [W3 schools docs on the DOM](http://www.w3schools.com/jsref/dom_obj_all.asp)
- [More W3 schools docs on events](https://developer.mozilla.org/en-US/docs/Web/Events)
