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

  //this will add our new function as a property on our controller
  this.add = addTodo;
  this.newTodo = {task: '', done: false};

  function addTodo(){
    this.all.push({task: this.newTodo.task, done: false});
    this.newTodo.task = '';
  }
}
