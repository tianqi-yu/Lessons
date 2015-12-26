var should    = require("chai").should(),
expect        = require("chai").expect,
supertest     = require("supertest"),
api           = supertest("http://localhost:3000")

describe("GET /Candies", function(){

  it("should return a 200 response", function(done){
    api.get("/candies")
    .set("Accept", "application/json")
    .expect(200, done)
  });

  it("should return an array", function(done){
    api.get("/candies")
    .set("Accept", "application/json")
    .end(function(error, response){
      expect(response.body).to.be.an('array');
      done()
    })
  })

  it("should return an object that have a field called 'name' ", function(done){
    api.get("/candies")
    .set("Accept", "application/json")
    .end(function(error, response){
      expect(response.body[0]).to.have.property('name');
      done()
    })
  })
})

describe("POST /candies", function(){
  before(function(done){
    console.log("in before")
    //first we send an object to be created
    api.post("/candies")
    .set("Accept", "application/json")
    .send({
      "id": 5,
      "name": "Lollipop",
      "color": "Red"
    }).end(done)
  })

  it("should add a candy object to the collection candies and return it", function(done){
    
    // NOw we query the index method to see if the new object is returned
    api.get("/candies")
    .set("Accept", "application/json")
    .end(function(error, response){
      expect(response.body.length).to.equal(5);
      done()
    })
  })
})