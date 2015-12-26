#CHEATSHEET MONGO

## DATABASES

|command       | description
|--------------|--------
| show dbs     | Shows database names
| db           | Shows current database in use
| use `dbname` | Creates -or switches- the databasen `dbname`

## COLLECTIONS

| action |command | description
|--------|--------|-------------------
| CREATE | [db.createCollection(name, options)](http://docs.mongodb.org/manual/reference/method/db.createCollection/) | Creates a new collection explicitly
| LIST   | [db.getCollectionNames()](http://docs.mongodb.org/manual/reference/method/db.getCollectionNames/) | Returns an array containing the names of all collections in the current database
| LIST   | [show collections](http://docs.mongodb.org/manual/reference/mongo-shell/) | Returns a list of all the names of all collections in the current database (Mongo-shell only)
| RENAME | [db.collection.renameCollection()](http://docs.mongodb.org/manual/reference/method/db.collection.renameCollection/)  | Renames a collection
| DELETE | [db.collection.drop()](http://docs.mongodb.org/manual/reference/method/db.collection.drop/) | Removes a collection from the database

## DOCUMENTS

| action |command | description
|--------|--------|-------------------
| CREATE | [db.collection.insert()](http://docs.mongodb.org/manual/reference/method/db.collection.insert/) | Inserts a document or documents into a collection
| READ   | [db.collection.find()](http://docs.mongodb.org/manual/reference/method/db.collection.find/) | Selects documents in a collection and returns a cursor to the selected documents
| READ   | [db.collection.findOne()](http://docs.mongodb.org/manual/reference/method/db.collection.findOne/) | Returns one document that satisfies the specified query criteria
| UPDATE | [db.collection.update()](http://docs.mongodb.org/manual/reference/method/db.collection.update/) | Modifies an existing document or documents in a collection
| DELETE | [db.collection.remove()](http://docs.mongodb.org/manual/reference/method/db.collection.remove/) | Removes documents from a collection
| COUNT  | [db.collection.count()](http://docs.mongodb.org/manual/reference/method/db.collection.count/) | Returns the count of documents that would match a find() query


## QUERY LANGUAGE
- [Index Reference](http://docs.mongodb.org/manual/core/indexes/)
- [Index Introduction](http://docs.mongodb.org/manual/core/indexes-introduction/)
- [Query Operators](http://docs.mongodb.org/manual/reference/operator/query/)
  - Comparison: $eq, $gt, $gte, $lt, $lte, $ne, $in
  - Logical:
  - Element
  - Evaluation
  - Geospatial
  - Arrays

## CURSOR

A pointer to the result set of a query. Clients can iterate through a cursor to retrieve results. By default, cursors timeout after 10 minutes of inactivity.

|command           | description
|------------------|-------------------
| cursor.count()   | Returns the total number of documents in a cursor.
| cursor.forEach() | Applies a JavaScript function for every document in a cursor.
| cursor.hasNext() | Returns true if the cursor has documents and can be iterated.
| cursor.itcount() | Returns the number of documents remaining in a cursor.
| cursor.limit()   | Constrains the size of a cursor’s result set.
| cursor.map()     | Applies a function to each document in a cursor and collects the return values in an array.
| cursor.max()     | Specifies an exclusive upper index bound for a cursor.
| cursor.min()     | Specifies an inclusive lower index bound for a cursor.
| cursor.next()    | Returns the next document in a cursor.
| cursor.size()    | Returns a count of the documents in the cursor
| cursor.sort()    | Returns results ordered according to a sort specification.
| cursor.toArray() | Returns an array that contains all documents returned by the cursor.

## INDEXES
