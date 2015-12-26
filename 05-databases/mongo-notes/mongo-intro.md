# MongoDB

## Introduction

MongoDB is an open-source document database that provides high performance, high availability, and automatic scaling.

### Document Database
MongoDB stores data in the form of documents, which are JSON-like field and value pairs. Documents are analogous to data structures in programming languages that associate keys with values (e.g. dictionaries, hashes, maps, and associative arrays).

Formally, MongoDB documents are [BSON documents](http://docs.mongodb.org/manual/reference/glossary/#term-bson). BSON is a binary representation of JSON with additional type information. In the documents, the value of a field can be any of the BSON data types, including other documents, arrays, and arrays of documents.

```js
{
  name: "Michael Smith",
  age: 32,
  hobbies: ["tennis", "guitar"],
  male: true
}
```

### A MongoDB document.
The advantages of using documents are:

- Documents (i.e. objects) correspond to **native data types** in many programming languages, including javascript
- Embedded documents and storing arrays reduce need for expensive joins
- Dynamic schema

### Key Features

#### High Performance
MongoDB provides high performance data persistence. In particular,

- Support for embedded data models reduces I/O activity on database system.
- Indexes support faster queries and can include keys from embedded documents and arrays.

#### High Availability
To provide high availability, MongoDB’s replication facility, called replica sets, provide:

- automatic failover.
- data redundancy.

A replica set is a group of MongoDB servers that maintain the same data set, providing redundancy and increasing data availability.

#### Automatic Scaling
MongoDB provides horizontal scalability as part of its core functionality.

- Automatic sharding distributes data across a cluster of machines.
- Replica sets can provide eventually-consistent reads for low-latency high throughput deployments.

## MongoDB Install & Setup

Installing MongoDB is a breeze thanks to our friend [HomeBrew](http://brew.sh/):

```
$ brew update && brew install mongodb
```

### How to run MongoDB?

#### Install as a Daemon
To have [launchd](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/launchd.8.html#//apple_ref/doc/man/8/launchd) start MongoDB at login, we need to add a soft link to our [LaunchAgents](https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html). `launchd` is Unix command in charge of managing  [agents/daemons](http://en.wikipedia.org/wiki/Daemon_%28computing%29):

> In multitasking computer operating systems, a daemon (/ˈdiːmən/ or /ˈdeɪmən/)[1] is a computer program that runs as a background process, rather than being under the direct control of an interactive user. Traditionally daemon names end with the letter d: for example, syslogd is the daemon that implements the system logging facility and sshd is a daemon that services incoming SSH connections.

We can easily accomplish this by running:

```
$ ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
```

After running this command and restarting the machine, we will have MongoDB running in the background every

#### Run MongoDB (one time only)

Or, if you don't want/need to have running as a Daemon, you can just run the [mongod command](http://docs.mongodb.org/manual/reference/program/mongod/#bin.mongod) and give it a path to the configuration file (by default):

```
$ mongod --config /usr/local/etc/mongod.conf
```

### Create the data directory.

Before you start MongoDB for the first time, create the directory to which the [mongod process](http://docs.mongodb.org/manual/reference/program/mongod/#bin.mongod) will write data (after all, it's a dabatase!).

By default, the mongod process uses the `/data/db` directory.

```
$ mkdir -p /data/db
```

*If you create a directory other than this one, you must specify that directory in the [dbpath](http://docs.mongodb.org/manual/reference/configuration-options/#storage.dbPath) option when starting the mongod process*

### Set permissions for the data directory.

Before running mongod for the first time, ensure that the user account running mongod has read and write permissions for the directory.


```
$ whoami
f3r

$ sudo chown YOUR_MAC_USER_HERE /data/db
```

We can test that it all works by trying to access the `mongo` CLI

```
$ mongo --version
MongoDB shell version: 3.0.1
```

## Run MongoDB Daemon

We should be all setup now!! To have Mongo running, we only need to run the mongod command (Mongo Daemon):

```
$ mongod
2015-04-06T20:53:10.969+0800 I JOURNAL  [initandlisten] journal dir=/data/db/journal
2015-04-06T20:53:11.008+0800 I CONTROL  [initandlisten] MongoDB starting : pid=21823 port=27017 dbpath=/data/db 64-bit host=f3rAir
2015-04-06T20:53:11.008+0800 I CONTROL  [initandlisten] db version v3.0.1
2015-04-06T20:53:11.008+0800 I CONTROL  [initandlisten] build info: Darwin miniyosemite.local 14.1.0 Darwin Kernel Version 14.1.0: Thu Feb 26 19:26:47 PST 2015; root:xnu-2782.10.73~1/RELEASE_X86_64 x86_64 BOOST_LIB_VERSION=1_49
2015-04-06T20:53:11.008+0800 I CONTROL  [initandlisten] options: {}
2015-04-06T20:53:11.107+0800 I STORAGE  [FileAllocator] creating directory /data/db/_tmp
2015-04-06T20:53:11.389+0800 I NETWORK  [initandlisten] waiting for connections on port 27017
```

Alternatively, if we want to have `Mongod` load a different database data, we can simply start it with `--dbpath` and the full path of where the data resides:

```
$ mongod --dbpath <some alternate directory>

```

To stop the mongod instance, press Control+C in the terminal where the mongod instance is running.


## Accessing Mongo

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
