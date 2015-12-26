# Using MongoDB

## MongoDB Useful Commands

### Let's get Started!

We can access our MongoDB databases through two main methods: one would be through the Mongo Shell utility, and through it's different drivers for programming languages. To start the mongo shell, simply type `mongo`:

```
$ mongo

MongoDB shell version: 3.0.1
connecting to: test
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
  http://docs.mongodb.org/
Questions? Try the support group
  http://groups.google.com/group/mongodb-user
>
```

### Let's get some help!

#### Main Help
```
> help
  db.help()                    help on db methods
  db.mycoll.help()             help on collection methods

  help connect                 connecting to a db help
  help misc                    misc things to know

  show dbs                     show database names
  show collections             show collections in current database
  show users                   show users in current database
  use <db_name>                set current database

  db.foo.find()                list objects in collection foo
  db.foo.find( { a : 1 } )     list objects in foo where a == 1
  it                           result of the last line evaluated; use to further iterate

  exit                         quit the mongo shell
```

## Managing the Database

After starting the mongo shell, your session will use the `test` database by default.

```
> db                    // What's the current database?
test

> show dbs              // List all the dabatases in the server
local  0.078GB

> use db_wdi            // Create a new Database "db_wdi"
switched to db db_wdi
```


## Collections

A database contains zero or more `Collections`. A `Collection` is a grouping of MongoDB documents (the equivalent of an RDBMS table). A collection exists within a single database (you can't have a collection divided across multiple dabatases).

Collections do not enforce a particular [schema](http://en.wikipedia.org/wiki/Database_schema). Therefore, documents within a collection can have different fields.

Typically, all documents in a collection have a similar or related purpose.


## MongoDB NameSpaces

A “namespace” is the concatenation of the database name and the collection names with a period character in between.

Collections are **containers for documents that share one or more indexes**. Databases are groups of collections stored on disk using a single set of data files.

For an example in the `db_wdi.students` namespace, `db_wdi` is the database name and `students` is the collection name.

*Period characters can occur in collection names, so that wdi_db.students.grades is a valid namespace, with `wdi_db` as the database name, and `students.grades` as the collection name.*

More info: [MongoDB NameSpaces](http://docs.mongodb.org/manual/faq/developers/#faq-dev-namespace)

## Documents

Collections are composed of documents, but collections are just like folders in our filesystem, they allow us to group documents but they don't contain the data itself, for that we need documents.

Documents are JSON-like field and value pairs. Documents are analogous to data structures in programming languages that associate keys with values (e.g. dictionaries, hashes, maps, and associative arrays).


```js
{
   _id: ObjectId("5099803df3f4948bd2f98391"),
   name: { first: "Alan", last: "Turing" },
   birth: new Date('Jun 23, 1912'),
   death: new Date('Jun 07, 1954'),
   male: true,
   contribs: [ "Turing machine", "Turing test", "Turingery" ],
   views : NumberLong(1250000)
}
```

The above fields have the following data types:

- **_id**: holds an ObjectId, a unique number to represent that document
- **name**: holds an embedded document that contains the fields first and last
- **birth and death**: hold values of the Date type
- **male**: hold values of the Boolean type
- **contribs**: holds an array of strings
- **views**: holds a value of the NumberLong type

#### Field Names

The field name **_id** is reserved for use as a [primary key](http://en.wikipedia.org/wiki/Unique_key); its value must be unique in the collection, is [immutable](http://en.wikipedia.org/wiki/Immutable_object), and may be of any type other than an array.

*Field Names **cannot** start with a `$`, contain a `.` or contain `null`*

## Modelling Data

Data in MongoDB has a flexible schema. Unlike SQL databases, where you must determine and declare a table’s schema before inserting data, MongoDB’s collections do not enforce document structure. This flexibility facilitates the mapping of documents to an entity or an object. Each document can match the data fields of the represented entity, even if the data has substantial variation. In practice, however, the documents in a collection share a similar structure.

The key challenge in data modeling is balancing the needs of the application, the performance characteristics of the database engine, and the data retrieval patterns. When designing data models, always consider the application usage of the data (i.e. queries, updates, and processing of the data) as well as the inherent structure of the data itself.

### Document Structure

The key decision in designing data models for MongoDB applications revolves around the structure of documents and how the application represents relationships between data. There are two tools that allow applications to represent these relationships: references and embedded documents.

#### References

[References](http://docs.mongodb.org/manual/reference/database-references/) store the relationships between data by including links or references from one document to another. Applications can resolve these references to access the related data. Broadly, these are normalized data models.

```js
var user = {
  _id:        <ObjectId_user>,
  github:     "f3r"
  github_url: "https://github.com/f3r",
}

var contact = {
  _id:     <ObjectId2>,
  user_id: <ObjectId1>,
  name:    "Fer",
  mail:    "fer@ga.co"
}

var access = {
  _id:     <ObjectId3>,
  user_id: <ObjectId1>,
  level:   5,
  group:   "instructors"
}
```

How do can we include references in our document?

```js
original_id = ObjectId()

db.contacts.insert({
    "_id":  original_id,
    "name": "Broadway Center",
    "url":  "bc.example.net"
})

db.access.insert({
    "name":      "Erin",
    "places_id": original_id,
    "url":       "bc.example.net/Erin"
})
```

#### Embedded Data

Embedded documents capture relationships between data by storing related data in a single document structure. MongoDB documents make it possible to embed document structures in a field or array within a document. These denormalized data models allow applications to retrieve and manipulate related data in a single database operation.

```js
var user = {
  _id:         <ObjectId_user>,
  github:      "f3r",
  github_url:  "https://github.com/f3r",
  contact: {
    name:    "Fer",
    mail:    "fer@ga.co"
  },
  access: {
    level:   5,
    group:   "instructors"
  }
}
```
