//
//  ViewController.swift
//  Vacation
//
//  Created by Sam Meech-Ward on 2018-09-04.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var dataManager: DataManager!
  
  var destinations = [Destination]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    do {
      try dataManager = DataManager()
    } catch {
      // Alert the user that our app in unusable
      // Or try and fix this somehow.
    }
    
    do {
      destinations = try dataManager.getAllDestinations()
    } catch {
      // Something went wrong
    }
    
    print(destinations)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

// Creating destintations

extension ViewController {
  private func saveDestinations() {
    let destinations = [
      Destination(name: "Hawaii", rating: 4, cost: NSDecimalNumber(string: "5000.00")),
      Destination(name: "Mexico", rating: 3, cost: NSDecimalNumber(string: "2000.01"))
    ]
    
    for destination in destinations {
      do {
        try dataManager.save(destination: destination)
      } catch {
        // Alert couldn't save their destination
      }
    }
  }
}

