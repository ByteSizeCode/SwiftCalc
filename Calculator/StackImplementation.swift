//
//  SatckImplementation.swift
//  Calculator
//

import Foundation

class Stack {
    var stackArray = [Int]()
    //create push function
    //create pop function
    
    func push(intToPush: Int){
        self.stackArray.append(intToPush)
    }
    
    func pop() -> Int? {
        if self.stackArray.last != nil {
            var stringToReturn = self.stackArray.last
            self.stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
}
