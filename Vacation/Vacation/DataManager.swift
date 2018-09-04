//
//  DataManager.swift
//  Vacation
//
//  Created by Sam Meech-Ward on 2018-09-04.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import FMDB

enum DataManagerError: Error {
  case open
  case createTables
}

class DataManager {
  
  let database: FMDatabase

  init() throws {
    let dbName = "vacation.db"
    let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbName)
    
    database = FMDatabase(url: fileURL)
    if !database.open() {
      // Handle error
      throw DataManagerError.open
    }
  }
  
  func createTables() throws {
    let sql = """
      CREATE TABLE destinations (
        id INTEGER PRIMARY KEY,
        name VARCHAR(50),
        rating INTEGER,
        cost INTEGER
      );
    """
    
    if !database.executeStatements(sql) {
      // Handle error
      throw DataManagerError.createTables
    }
  }
  
  func save(destination: Destination) throws {
    let sql = """
      INSERT INTO destinations (name, rating, cost)
      VALUES (?, ?, ?)
    """
    
    try database.executeUpdate(sql, values: [destination.name, destination.rating, destination.costInt])
  }
  
  
  func getAllDestinations() throws -> [Destination] {
    let sql = """
      SELECT * FROM destinations;
    """
    
    let results = try database.executeQuery(sql, values: nil)
    
    var destinations = [Destination]()
    
    while (results.next()) {
      
      let name = results.string(forColumn: "name") ?? "NO NAME"
      let rating = Int(results.int(forColumn: "rating"))
      let costInt = results.int(forColumn: "cost")
      let cost = NSDecimalNumber(value: costInt).dividing(by: 100)

      let destination = Destination(name: name, rating: rating, cost: cost)
      destinations.append(destination)
    }
    
    return destinations
  }
  
}
