# Angular Directives

### Objectives

- Use ng-repeat to iterate over data
- Use ng-if & ng-hide/ng-show to hide & show elements
- Use form to build forms
- Research other Angular directives that are included in Angular's library

### Preparation

- Set up a basic Angular app
- Create a basic controller with hardcoded data

## What Are Directives? Intro (5 mins)

Directives are additional DOM nodes – think custom attributes on HTML tags – that Angular uses to apply behaviors to HTML elements. Angular comes with a bunch of different directives for different behaviors and gives you the ability to create your own.

There are a few you'll be using all the time that we're gonna walk through together, today. There are also a few you've already used – `ng-app` and `ng-controller`. You added them onto HTML tags to tell your Angular app what module we were using and what controller we wanted to ask for data from. Those are two examples of specific behaviors so let's see a few more.

## What are we building? Demo (5 mins)

Our end goal for this lesson is to build ourselves a simple little todo app. Shocking, it's true, but it'll be a great way to demonstrate both directives and interacting with controllers.

> Note: Show students the finished app from the [solution code](solution-code) folder.

We have a lot to get through – we'll have to list an array of todos, demonstrate some simple hiding & showing mechanisms, and bind some changing data via a form.

## Set up your app - Independent Practice (5 mins)

Since you guys are killers at setting up Angular apps from yesterday, take five minutes to make empty JS and CSS folders, make an `app.js` and a `todosController.js` and get set up. Don't forget an index, with sourced JS files! Make those files, go go go!

## ng-repeat - Codealong (20 minutes)

Let's start filling in our `todosController` a little bit - add in some initial seed data:

```js
angular
    .module("todoApp")
    .controller("TodosController", TodosController);

function TodosController(){
  // this is our hardcoded seed data
  this.all = [
      {task: "build an awesome todo list", done: false},
      {task: "get super good at Angular", done: false},
      {task: "party on code", done: false},
      {task: "tackle the bonus challenges for this lesson", done: false},
      {task: "take a nap", done: false}
  ];

}
```

This is great - we've got an array of simple objects. Granted, `.all` is whatever we want it to be, but calling it that makes it feel almost 'ActiveRecordy', doesn't it? Totally your choice, though.

Now, let's start filling out the view with this data; head over to `index.html`.

```html
<body>
  <header>
    <h1>Angular Todo App</h1>
    <h3>You have {{}} todos to do!</h3>
  </header>
</body>
```

Now, how do we get the data our controller has access to?

```html
<body ng-controller="TodosController as todos">
  <header>
    <h1>Angular Todo App</h1>
    <h3>You have {{todos.all.length}} todos to do!</h3>
  </header>
</body>
```

<img width="752" alt="screen shot 2015-07-31 at 3 45 04 am" src="https://cloud.githubusercontent.com/assets/25366/9005855/8e7bee44-3736-11e5-9276-d930778b197a.png">

Beautiful! But we need more. How do we actually list out our todos? `ng-repeat`.

```html
<ul id='todos'>
  <li ng-repeat="todo in todos.all">
    {{todo.task}}
  </li>
</ul>
```

<img width="752" alt="screen shot 2015-07-31 at 3 49 11 am" src="https://cloud.githubusercontent.com/assets/25366/9005933/1e6c49cc-3737-11e5-8f4d-3dd46a471c34.png">


Let's walk through that. First, hello `ng-repeat`! This is used for iterating over repeating elements. Rather than our old-fashioned `for` loop, Angular uses `ng-repeat` on the element we want to iterate over. Sort of like Ruby (or JavaScript's forEach), we say:

> "For each item in `todos.all`, call the one we're on `todo`."

Then, inside that element, we have access to `{{todo.whateverAttributesTodoHas}}`.

## Adding a Todo - Codealong (15 mins)

Now, let's see how _data binding_ works by adding to our list! We'll need a form.

```html
      <form id='add-todo'>
        <input type="text" placeholder='I need to...'>
      </form>
```

Super simple - this does nothing, yet, but we need it to add to our list when we hit enter and submit it. **On the controller side, how would we write a function that adds a new item to our array?**

Maybe something like:
```js
//this will add our new function as a property on our controller, so we can use it in the view
this.add = addTodo;

// this just adds a new object to our array, with defaults for now
function addTodo(){
  this.all.push({task: "something", done: false});
}
```

By including the `this.addTodo = addTodo;` line, we now can use that function in our view, when we want to. So check out this other useful form directive:


```html
      <form id='add-todo' ng-submit="todos.add()">
        <input type="text" placeholder='I need to...'>
      </form>
```

Now, it'll be adding fake todos, but I can't resist – try it! You'll see why Angular is so exciting. As soon as you press enter, **it auto-updates the list and the count** above, without any extra work. That's _data binding_, it's watching for changes to our data in the controller and updating the view _for_ us.

## ng-model Codealong (15 mins)

Obviously we don't want to only use dummy data. How do we keep an eye on what's in the input and send _that_ to our `addTodo` function? You guessed it, another directive!

But first, let's think of it like this: we're going to be adding a new todo to our list of existing todos and that todo will be an object just like our others. Something like:

```js
{task: 'whatever we type', done: false}
```

So maybe let's make a `newTodo` object in our controller:

```js
this.newTodo = {task: '', done: false};
```

Now we know that in both the controller, and now, the view, if we access the `.newTodo`, we can share data. This is where another awesome directive comes into play – `ng-model`.

In `index.html`:
```html
<form id='add-todo' ng-submit="todos.add()">
  <input type="text" placeholder='I need to...' ng-model="todos.newTodo.task">
</form>
```

What does `ng-model` do? It binds the data not just from the controller to the view like we saw earlier but the other way around, too. As we type in our input, the actual object of `newTodo` changes, specifically the `task` attribute inside that object.

Don't believe me? Let's watch it happen.

```html
<form id='add-todo' ng-submit="todos.add()">
  <input type="text" placeholder='I need to...' ng-model="todos.newTodo.task">
</form>
<p>About to add todo: <strong>{{todos.newTodo.task}}</strong></p>
```

You can see, it keeps the data synced, nearly in realtime. That's _powerful._

The last step is update our `todos.add()` function to utilize this new knowledge. Just like in the view, how do you think we access that newTodo in our controller?

```js
function addTodo(){
  this.all.push({task: this.newTodo.task, done: false});
  // this last piece isn't necessary, but nicely resets the task to an empty string, which will clear the textbox because the view is bound to the data
  this.newTodo.task = '';
}
```

## ng-hide Codealong (5 mins)

We're pretty much at capacity for now, but there's one other awesome useful directive you might want to try.

As an example, let's say we think the paragraph that says "About to add todo: blah blah" only should show when `newTodo` isn't empty. Normally, we'd use some sort of if/else statement...

```html
<form id='add-todo' ng-submit="todos.add()">
  <input type="text" placeholder='I need to...' ng-model="todos.newTodo.task">
</form>
<p ng-if='todos.newTodo.task'>About to add todo: <strong>{{todos.newTodo.task}}</strong></p>
```

Boom. Beautiful. Play with it, watch it go!

## Conclusion (5 mins)

Now, in the next lab, you're going to practice this and hopefully, learn a few extra included directives along the way.

- How do we add a function to a controller?
- How do we iterate over an array of items?
- How do we submit a form?
