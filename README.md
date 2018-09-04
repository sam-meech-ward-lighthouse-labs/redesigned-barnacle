# SQLite in Swift

## SQL

* Structured Query Language
* Create tables, do queries
* Relational databases
* Created by IBM sequl
* SQLite, MYSQL, SQL SERVER, ORACLE, PostgreSQL. 

## SQLite

* The database exists within the application using it. (distributed)
* Pretty bad for sharing.
* A really good choice for embedded devices.

* The database is just a file. 
* You could, potentially, share the database file with other app users.

* SQLite is written in C
* C is *probably* the most compatible language in the world. 
* Usually binding from most languages to C.

> Core Data on iOS uses SQLite for its persistance. 

## C APIs in Swift

[Pointers](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html#//apple_ref/doc/uid/TP40014216-CH8-ID17)

## FMDB



## SQLite in Swift

* Opening a database connection with a database file
* Closing a connection
* executing a create table query using sqlite3_exec()
* executing an insert query sqlite3_exec()
* Monetery values
* Dates

---

## Links

* [SQLite3 C API](https://www.sqlite.org/capi3ref.html)
* [NSUserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)

## Snippets

```swift
let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(name)
```

```sqlite
.mode column
.headers on
```w