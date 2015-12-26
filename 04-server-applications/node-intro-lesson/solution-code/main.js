var myFavorite = require('./car');

myFavorite.car.accelerate(60);
myFavorite.car.decelerate(30);

console.log("My favorite car is currently driving " + myFavorite.car.speed + "mph");
