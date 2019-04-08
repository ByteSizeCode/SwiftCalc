//
//  ViewController.swift
//  Calculator
//
//  Created by Isaac Raval on 4/7/19.
//  Copyright © 2019 organization. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var viewWindow: NSScrollView!
    
    //Array for numbers and Math Symbols As Individual Charectors (e.g. as 2,5,2,+,3,7 representing 252 + 37)
    var numsAndMathSymbolsAsIndividualCharectors = [Character]()
    
    //Array for operators
    var mathSymbols = [Character]()
    
    //Array for the complete numbers (e.g. 2,5,2 as 252)
    var numsWhole = [Int]()
    
    //Stores calculations in equal sign function
    var newEvaluation = 0
    
    @IBAction func zero(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("0")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("0")
    }
    
    @IBAction func one(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("1")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("1")
    }
    
    @IBAction func two(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("2")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("2")
    }
    
    @IBAction func three(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("3")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("3")
    }
    
    @IBAction func four(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("4")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("4")
    }
    
    @IBAction func five(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("5")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("5")
    }
    
    @IBAction func six(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("6")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("6")
    }
    
    @IBAction func seven(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("7")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("7")
    }
    
    
    @IBAction func eight(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("8")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("8")
    }
    
    
    @IBAction func nine(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperator()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("9")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("9")
    }
    
    @IBAction func plus(_ sender: NSButton) {
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Display appropriate math symbol
        viewWindow.documentView!.insertText("+")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("+")
    }
    
    @IBAction func minus(_ sender: NSButton) {
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Display appropriate math symbol
        viewWindow.documentView!.insertText("-")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("-")
    }
    
    @IBAction func divide(_ sender: NSButton) {
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Display appropriate math symbol
        viewWindow.documentView!.insertText("/")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("/")
    }
    
    @IBAction func multiply(_ sender: NSButton) {
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Display appropriate math symbol
        viewWindow.documentView!.insertText("*")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("*")
    }
    
    
    @IBAction func equalitySign(_ sender: NSButton) {
        var combineDidgitsIntoNumber = ""
        
        numsAndMathSymbolsAsIndividualCharectors.append("=")
        
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //evaluate equation
        for numSymChar in numsAndMathSymbolsAsIndividualCharectors {
//            print(numSymChar)
            switch (numSymChar.self) {
            case "0":
                combineDidgitsIntoNumber.append("0")
                continue;
            case "1":
                combineDidgitsIntoNumber.append("1")
                continue;
            case "2":
                combineDidgitsIntoNumber.append("2")
                continue;
            case "3":
                combineDidgitsIntoNumber.append("3")
                continue;
            case "4":
                combineDidgitsIntoNumber.append("4")
                continue;
            case "5":
                combineDidgitsIntoNumber.append("5")
                continue;
            case "6":
                combineDidgitsIntoNumber.append("6")
                continue;
            case "7":
                combineDidgitsIntoNumber.append("7")
                continue;
            case "8":
                combineDidgitsIntoNumber.append("8")
                continue;
            case "9":
                combineDidgitsIntoNumber.append("9")
                continue;
            case "+":
                //When hitting operator, convert combined number to int
                var convToInt: Int = Int(combineDidgitsIntoNumber) ?? 99999
                //Add to array
                print("Adding \(convToInt)")
                numsWhole.append(convToInt)
                //Add operator to array
                mathSymbols.append("+")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
                
            case "-":
                //When hitting operator, convert combined number to int
                var convToInt: Int = Int(combineDidgitsIntoNumber) ?? 99999
                //Add to array
                numsWhole.append(convToInt)
                //Add operator to array
                mathSymbols.append("-")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
            case "*":
                //When hitting operator, convert combined number to int
                var convToInt: Int = Int(combineDidgitsIntoNumber) ?? 99999
                //Add to array
                numsWhole.append(convToInt)
                //Add operator to array
                mathSymbols.append("*")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
            case "/":
                //When hitting operator, convert combined number to int
                var convToInt: Int = Int(combineDidgitsIntoNumber) ?? 99999
                //Add to array
                numsWhole.append(convToInt)
                //Add operator to array
                mathSymbols.append("/")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
            case "=":
                //When hitting operator, convert combined number to int
                var convToInt: Int = Int(combineDidgitsIntoNumber) ?? 99999
                print("Adding \(convToInt)")
                //Add to array
                numsWhole.append(convToInt)
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
                
            default:
                print("error")
            }
        }
        
        
//        var timesLooped = 1
        var evaluationSoFar = Stack()
        evaluationSoFar.push(intToPush: numsWhole[0]) //Create stack and start out with first value for sum/subtracting/multiplying/dividing algorithm
        
        
        //(e.g. 43 + 5)
        for i in 0...(numsWhole.capacity - 2) {
            //e.g.     5                  +               2
//            print("\(numsWhole[i])")
//            Check if the index for mathSymbols exists
//            if(mathSymbols.indices.contains(i)) {
//                print("\(mathSymbols[i])")
//            }
            
            //Evaluate expression
            if(mathSymbols.indices.contains(i)) {
                switch(mathSymbols[i]) {
                    
                case "+":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Sum evaluation so far, plus next number
                    newEvaluation = (value + self.numsWhole[i + 1])
                    print("summing \(value) and \(self.numsWhole[i + 1])")
                    print(newEvaluation)
                    //Add new evaluation to stack
                    evaluationSoFar.push(intToPush: newEvaluation)
                    
//                    timesLooped += 1
                    continue
                case "-":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Subtract evaluation so far, plus next number
                    newEvaluation = (value - self.numsWhole[i + 1])
                    //                    print("summing \(value) and \(self.numsWhole[i + 1])")
                    //                    print(newEvaluation)
                    //Add new evaluation to stack
                    evaluationSoFar.push(intToPush: newEvaluation)
                    
//                    timesLooped += 1
                    continue
                case "*":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Multiply evaluation so far, plus next number
                    newEvaluation = (value * self.numsWhole[i + 1])
                                        print("multiplying \(value) and \(self.numsWhole[i + 1])")
                                        print(newEvaluation)
                    //Add new evaluation to stack
                    evaluationSoFar.push(intToPush: newEvaluation)
                    
//                    timesLooped += 1
                    continue
                case "/":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Divide evaluation so far, plus next number
                    newEvaluation = (value / self.numsWhole[i + 1])
                    //                    print("summing \(value) and \(self.numsWhole[i + 1])")
                    //                    print(newEvaluation)
                    //Add new evaluation to stack
                    evaluationSoFar.push(intToPush: newEvaluation)
                    
//                    timesLooped += 1
                    continue
                    
                    
                default: //Is a number
                    continue
                }
            }
        }
        //erase stack and arrays
        evaluationSoFar.pop()
        mathSymbols.removeAll()
        numsWhole.removeAll()
        numsAndMathSymbolsAsIndividualCharectors.removeAll()
        
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //show result in viewWindow
        //Display appropriate number
        viewWindow.documentView!.insertText("\(newEvaluation)")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func clearDisplayIfLastButtonWasOperator() {
        //Get content of viewWindow
        let getViewWindowContent: NSTextView = viewWindow.documentView! as! NSTextView
        let contentsOfViewWindow:String = getViewWindowContent.string
        
        //If last button pressed was an operator, clear screen
        if(contentsOfViewWindow == "*" ||
            contentsOfViewWindow == "/" ||
            contentsOfViewWindow == "+" ||
            contentsOfViewWindow == "-") {
            //Clear viewWindow
            viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        }
    }


}

