//
//  Destination.swift
//  Vacation
//
//  Created by Sam Meech-Ward on 2018-09-04.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation

struct Destination {
  let name: String, rating: Int, cost: NSDecimalNumber
  
  var costInt: Int {
    return self.cost.multiplying(by: NSDecimalNumber(string: "100")).intValue
  }
}

extension Destination: CustomStringConvertible {
  var description: String {
    return "NAME: \(self.name)\n RATING: \(self.rating)\n COST: \(self.cost)\n\n"
  }
}
