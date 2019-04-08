//
//  SatckImplementation.swift
//  Calculator
//

import Foundation

class Stack {
    var stackArray = [Double]()
    //create push function
    //create pop function
    
    func push(intToPush: Double){
        self.stackArray.append(intToPush)
    }
    
    func pop() -> Double? {
        if self.stackArray.last != nil {
            var stringToReturn = self.stackArray.last
            self.stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
}
