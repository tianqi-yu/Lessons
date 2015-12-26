# Assessment Answer
## Week 8
#### Day 1

##### Questions

- What is MongoDB?
  > MongoDB is a document database that provides high performance, high availability, and easy scalability.

- Why do we need a Database?
  >  To store data so that they are retrievable / modifiable later

- What format does MongoDB use to store data?
  > BSON /ˈbiːsɒn/ is a computer data interchange format used mainly as a data storage and network transfer format in the MongoDB database. It is a binary form for representing simple data structures and associative arrays (called objects or documents in MongoDB).

- What's the differences between relational Database and a document database?
  > There are two major differences. First, Document DB is schema-less. The documents in the DB collection can have completely different types and number of fields from each other unlike Relational DB. Second, there are no join tables. In a Relational DB, join tables allows us to prevent duplication of data however because you spread information across a rigid structure, it makes it more difficult to change the structure during production, and it is also difficult to distribute the data across multiple servers.

- Please explain pros and cons for NoSQL
  - pros:
    - Mostly open source.
    - Horizontal scalability. There’s no need for complex joins and data can be easily sharded and processed in parallel.
    - No need to develop fine-grained data model – it saves development time.
    - Easy to use.
    - Very fast for adding new data and for simple operations/queries.
    - No need to make significant changes in code when data structure is modified.
    - Ability to store complex data types (for document based solutions) in a single item of storage.
  - cons:
    - Immaturity. Still lots of rough edges.
    - Possible database administration issues. NoSQL often sacrifices features that are present in SQL solutions “by default” for the sake of performance. For example, one needs to check different data durability modes and journaling in order not to be caught by surprise after a cold restart of the system. Memory consumption is one more important chapter to read up on in the database manual because memory is usually heavily used.
    - No indexing support (Some solutions like MongoDB have indexing but it’s not as powerful as in SQL solutions).
    - No ACID (Some solutions have just atomicity support on single object level).
    - Bad reporting performance.
    - Absence of standardization. No standard APIs or query language. It means that migration to a solution from different vendor is more costly. Also there are no standard tools (e.g. for reporting)

##### Exercise

** Submit the commands required to make this happen **

1. Create a new MongoDB Database in your computer named `w8d1`
  ```terminal
  use w8d1
  ```

1. Create a `animals` collection within it
  ```terminal
  db.createCollection("animals")
  ```

1. Add 3 `animals` with different attributes to the collection
  ```terminal
  db.animals.insert({
      name: "dog"
  })

  db.animals.insert({
      name: "cat"
  })

  db.animals.insert({
      name: "dragon"
  })
  ```

1. Create a `owners` collection
  ```terminal
  db.createCollection("owners")
  ```

1. Add 3 `owners` with different attributes to the collection
  ```terminal
  db.owners.insert({
      name: "Dennis"
  })

  db.owners.insert({
      name: "Fer"
  })

  db.owners.insert({
      name: "World"
  })
  ```

1. Add 1 `animal` to each `owner`:
  - one by reference
  - one embedded
  ```terminal
  dennis_id = db.owners.findOne({name: "Dennis"})._id

  db.animals.update(
      { "_id": ObjectId("552b1b33d04b0d6420cc23b7") },
      { name: "Hello Kitty", owner_id: dennis_id }
  )

  db.animals.insert(
     {
          name: "Minions",
          owner: {
              name: "Fer"
          }
      }
  )
  ```


**BONUS**

- Update all `animals` to include the number of legs each one has
  ```terminal
  db.animals.update({ }, { $set: { legs: 4 } }, { multi: true })
  ```

- Write a query that will return how many animals have at least 4 legs
  ```terminal
  db.animals.find({ legs: { $gte: 4 } })
  ```
