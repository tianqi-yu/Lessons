# Mongo-backed Models with Mongoose

### Objectives
*After this lesson, students will be able to:*

- Update & destroy a model
- Initialize & create a new instance of a model
- Perform basic find queries
- Reference other documents in an instance of a model
- Work with embedded and referenced documents with Mongoose

### Preparation
*Before this lesson, students should already be able to:*

- Describe how Mongo documents work
- Describe how an ORM works
- Create a basic NodeJS app

## Using MongoDB with Node - Intro (5 mins)

NodeJS and MongoDB work really well together. To handle HTTP requests and read from or send data to MongoDB, Mongoose is the most common Node.js ORM to manipulate data using MongoDB: CRUD functionality is something that is necessary in almost most every application, as we still have to create, read, update, and delete data.

Since we'll be able to use JSON across our application - with Mongo and Node - using JavaScript in our application is much easier. The MEAN stack - Mongo, Express, Angular, and Node - is becoming increasingly popular because of this.

For today, we will build a simple Node app in a folder and a file app.js.

#### What Is Mongoose?

Mongoose is an object modeling package - think ORM for Node; this gives us the MongoDB CRUD commands.

## Setting up Mongoose in your app - Codealong (5 mins)

Create a new Express app and install the relevant npm packages:

1. `mkdir family-tree`
2. `cd family-tree`
3. `npm init`
4. `npm install express --save`
5. `npm install morgan --save`
6. `npm instal body-parser --save`
7. `touch app.js` in family-tree directory

To use Mongoose in your Node app:

```bash
$ npm install mongoose --save
```

With the package installed, lets use it - open app.js and add:

```javascript
// Standard stuff
var express = require('express');

// A package to help manipulate paths
// More info: https://docs.nodejitsu.com/articles/file-system/how-to-use-the-path-module
var path = require('path');

var logger = require('morgan');
var bodyParser = require('body-parser');
var app = express();

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// Mongoose stuff
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/family-tree');
```

You can now execute all the mongoDB commands over the database `family-tree`.


## Working with Models - Codealong (20 mins)


#### Defining a Model

We must build a Mongoose Model before we can use any of our new CRUD operations; think of the models as constructors we define, documents we can persist to and request from our database. Just like a `schema.rb` file, our Mongoose Schema is what we'll use to define our document attributes. Think about it like this: a document is the equivalent of a record/row in a relational database; only here, our attributes - or columns - are flexible.

One large different from Rails/Sinatra: we can define methods in our Mongoose schema!

From within our family-tree app:

```bash
mkdir models
touch models/user.js
```

Now let's add:

```javascript
var mongoose = require('mongoose');

// create a schema
var userSchema = new mongoose.Schema({
  first_name: String,
  last_name: String,
  email: { type: String, required: true, unique: true },
  meta: {
    age: Number,
    website: String,
    address: String,
    country: String,
  },
  created_at: Date,
  updated_at: Date
});
```

MongoDB is schemaless, meaning: all the documents in a collection can have different fields, but for the purpose of a web app, often containing validations, it's better to use a schema that will cast and validate each type.

At the moment we only have the schema, representing the structure of the data we want to use. To save some data, we will need to make this file a Mongoose model and export it:

```javascript
//in users.js
var mongoose = require('mongoose');

var userSchema = new mongoose.Schema({
  first_name: String,
  last_name: String,
  email: { type: String, required: true, unique: true },
  meta: {
    age: Number,
    website: String,
    address: String,
    country: String,
  },
  created_at: Date,
  updated_at: Date
});

var User = mongoose.model('User', userSchema);

// make this available to our other files
module.exports = User;
```

Notice that you can use hashes and nested attributes inside a hash.

Here's a look at the datatypes we can use in Mongoose documents:

- String
- Number
- Date
- Boolean
- Array
- Buffer
- Mixed
- ObjectId

Also, notice we create the Mongoose Model with `mongoose.model`. Remember, we can define custom methods here - this would be where we could write a method to encrypt a password.

#### Creating Custom Methods

When defining a schema, you can add custom methods and call these methods on the models.  You can even overwrite the default Mongoose document methods.  Anyway, let's write a `sayHello` function under our schema:

```javascript
var userSchema = new mongoose.Schema({
  first_name: String,
  last_name: String,
  email: { type: String, required: true, unique: true },
  meta: {
    age: Number,
    website: String,
    address: String,
    country: String,
  },
  created_at: Date,
  updated_at: Date
});

userSchema.methods.sayHello = function() {
  console.log("Hi " + this.first_name);
};

var User = mongoose.model('User', userSchema);

module.exports = User;
```

Now we can call it by requiring the User model in app.js:

```javascript
var User = require('./models/user');

// create a new user called chris
var gerry = new User({
  first_name: 'Gerry',
  meta:{
    age: 27
  }
});

gerry.sayHello();
```

Now run the app with `node app.js` to see the result!

## Interacting with MongoDB's CRUD - Demo (15 mins)

Let's hope into an interactive shell and test out CRUD functionality.  To do this, from our app directory, we'll have to type in `node` and then require our Models manually.

#### Create

We'll create two users using the User method from before, along with the default save method from Mongoose:

```javscript
var User = require('./models/user');

var newUser = User({
  first_name: 'gerry',
  email: 'gerry@gmail.com',
  password: 'password',
});

// save the user
newUser.save(function(err) {
  if (err) console.log(err);
  console.log('User created!');
});
```

#### What about Read?

Just like ActiveRecord, we can use the JavaScript equivalent of `.all`, `.find_by_`, and `.find` to get a hold of what we're looking for.

Inside `app.js` let's add:

```javscript
// Find All
User.find({}, function(err, users) {
  if (err) console.log(err);
  console.log(users);
});
```

...and just like `.find_by_` in ActiveRecord, you'll get the first record that matches the attributes defined, but in Mongoose, it's `.find`:

```javascript
//Find One
User.find({ first_name: 'gerry' }, function(err, user) {
  if (err) console.log(err);
  console.log(user);
});
```

The ActiveRecord equivalent of `.find` is `.findById`:

```javascript
// get a user with ID of 1
User.findById(1, function(err, user) {
  if (err) console.log(err);
  console.log(user);
});
```

#### Update

For update, you can do it in one of two ways (that are super easy!) - using `.findByIdAndUpdate()` or `.findOneAndUpdate()`:

```javascript
User.findOneAndUpdate({ first_name: 'gerry' }, { meta: { age: 26 } }, function(err, user) {
  if (err) console.log(err);

  console.log(user);
});
```

#### Destroy

Mongoose gives you two easy methods to delete documents - `findByIdAndRemove()`and `.findOneAndRemove()`.

```javascript
// find the user with id 4
User.findOneAndRemove({ first_name: 'gerry' }, function(err) {
  if (err) console.log(err);
  console.log('User deleted!');
});
```

## Independent Practice (20 mins)

Using the code we just wrote and the [official Mongoose Models docs](http://mongoosejs.com/docs/models.html). Add custom three methods to models/users.js:

- `/all`, this will return all the documents
- `/create`, given some arguments in the url, this method will create a `user` record.
- `/delete/:id`, will remove the document corresponding to the collection

Try them out in the `node` terminal, if you have time.

## What are embedded documents? Codealong (20 mins)

> Note: Go slowly through this section as we anticipate students having trouble

Embedded documents are just what they sound like: documents with their own schemas nested in other documents. They take of the form of objects within an array.  You can think of this as a sort of `has_many` relationship - the context to use embedded documents is data entities need to be used/viewed in context of another.

The nested schema are equipped with all the same features as your models: defaults, validators, middleware, and even error handling, as they are tied to the save() error callback; and Mongoose can work with embedded documents by default.


Let's look at these two schemas below - we can embed `childSchema` into the property `children`:

```javascript
var childSchema = new Schema({ name: 'string' });

var parentSchema = new Schema({
  children: [childSchema]
})

var Parent = mongoose.model('Parent', parentSchema);
var parent = new Parent({ children: [{ name: 'Matt' }, { name: 'Sarah' }] })
parent.children[0].name = 'Matthew';
parent.save(function(err) {
  if (err) console.log(err);
  console.log('New Parent!');
});
```

Or from mongoDB official docs, we can look at this example with Patron and Address models:

```javascript
{
   _id: "joe",
   name: "Joe Bookreader"
}

{
   patron_id: "joe",
   street: "123 Fake Street",
   city: "Faketon",
   state: "MA",
   zip: "12345"
}

{
   patron_id: "joe",
   street: "1 Some Other Street",
   city: "Boston",
   state: "MA",
   zip: "12345"
}
```
The address documents make two references to the Joe Bookreader object, so instead we can:

```javascript
{
   _id: "joe",
   name: "Joe Bookreader",
   addresses: [
                {
                  street: "123 Fake Street",
                  city: "Faketon",
                  state: "MA",
                  zip: "12345"
                },
                {
                  street: "1 Some Other Street",
                  city: "Boston",
                  state: "MA",
                  zip: "12345"
                }
              ]
 }
 ```

Note that sub-documents do not save individually, only with the highest-level document; in this case, the addresses are saved with the Joe Bookreader Patron document.

#### Finding a sub-document

All documents in Mongoose have an  `_id`.  Look above at our Patron example.  Joe Bookreader has an `_id` of 'joe'. DocumentArrays have a special `id` method for looking up a document by its _id.

```javascript
// in our first example
var doc = parent.children.id(id_you_are_looking_for);

// in the second example
var doc = patron.addresses.id(id_you_are_looking_for)
```

#### Adding and Removing sub-docs

Remember Ruby methods like `pop`, `push`, or the `<<` operator?  We'll, Mongoose comes with MongooseArray methods like as `push`, `unshift`, `addToSet`, and others.  And just like adding them, we can remove them with `remove()`

Using code from the official docs, we can see how these are used:

```javascript
var Parent = mongoose.model('Parent');
var parent = new Parent;

// create a child
parent.children.push({ name: 'Liesl' });
var subdoc = parent.children[0];
console.log(subdoc) // { _id: '501d86090d371bab2c0341c5', name: 'Liesl' }
subdoc.isNew; // true

parent.save(function (err) {
  if (err) return handleError(err)
  console.log('Success!');
});

//remove

var doc = parent.children.id(id_you_are_looking_for).remove();
parent.save(function (err) {
  if (err) return handleError(err);
  console.log('the sub-doc was removed')
});

```

Sub-docs may also be created without adding them to the array by using the create method of MongooseArrays.

```javascript
var newdoc = parent.children.create({ name: 'Aaron' });
```

## Conclusion (5 mins)
Mongoose is just a bridge to use MongoDB inside a NodeJS environment. There are a lot of options when creating a schema with Mongoose, we've just seen a few for the moment.

- How does Mongoose compare to ActiveRecord?
- How does the schema in Mongoose/Mongo/Express compare to Rails?
