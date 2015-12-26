var numStudents = 100;
var classGrades = [];

//------------------------------------------------------------------------
// Write a function `initializeGrades` that given a number `num`,
// will initialize an array with `num` random grades between 0 and 10.
//------------------------------------------------------------------------
var initializeGrades = function (num) {
  var arr = [];
  for (var i=1; i<=num; i++) {
    arr.push( parseInt(Math.random() * 10) );
  }
  return arr;
};

classGrades = initializeGrades(numStudents);
console.log('initialized', classGrades);

//------------------------------------------------------------------------
// Write a function `removeMinMax` that, given an array `grades`, it will:
// - Remove the **highest** and **smallest** score from the array
// - Print out the `max` and `min` in console.log
//------------------------------------------------------------------------
var removeMinMax = function (grades) {
  var min =  100;
  var max = -100;

  grades.forEach(function(elem, idx){
    if (elem < min) { min = elem;}
    if (elem > max) { max = elem;}
  });

  console.log('min = ' + min);
  console.log('max = ' + max);

  var newArr = [];
  grades.forEach(function(elem, idx){
    if (elem !== min && elem !== max) {
      newArr.push(elem);
    }
  });

  return newArr;
};

classGrades = removeMinMax(classGrades);
console.log('removed', classGrades);

//------------------------------------------------------------------------
// Write a function `removeDuplicates` that, given an array `grades`,
// it will remove the duplicate members from an array and return out the final array.
//------------------------------------------------------------------------
var removeDuplicates = function (grades) {
  var exists = {};
  var uniqGrades = [];

  grades.forEach(function(elem){
    if (!exists[elem]) {
      exists[elem] = true;
      uniqGrades.push(elem);
    }
  });

  return uniqGrades;
};

console.log('simple array', removeDuplicates([1,3,3,3,1,5,5,5,6,7,8,1]));
console.log('classGrades',  removeDuplicates(classGrades));

//------------------------------------------------------------------------
// Write a JavaScript function to clone an array.
//------------------------------------------------------------------------

var arrayClone = function (array) {
  return array.slice();
};

var array = [1, 2, 4, 0];
var clonedArray = arrayClone(array);

clonedArray[0] = 5;
console.log(array);
console.log(clonedArray);

//------------------------------------------------------------------------
// Write a JavaScript function that will clone an array.
//  If any element of the array is an array, it will also make a copy of that array
//------------------------------------------------------------------------

var deepClone = function (array) {
  var result = [];
  for(var i = 0; i < a.length; i++) {
    result.push (a[i].isArray ? deepClone(a[i]) : a[i]);
  }
  return result;
}

console.log(deepClone([1, 2, [4, 0, [2, 8], 4, 19, [3, 4]], 77]));
