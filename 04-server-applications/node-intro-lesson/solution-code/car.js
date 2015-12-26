var car = {
  color: 'red',
  convertible: true,
  speed: 0,
  accelerate: function (mph) {
    oldSpeed = this.speed;
    this.speed += mph;
    return "Speeding up! " + oldSpeed + " to " + this.speed + "mph!";
  },
  decelerate: function (mph) {
    oldSpeed = this.speed;
    this.speed -= mph;
    return "Slowing down! " + oldSpeed + " to " + this.speed + "mph!";
  }
};

module.exports.car = car;
