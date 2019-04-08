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
    var numsWhole = [Double]()
    
    //Stores calculations in equal sign function
    var newEvaluation = 0.0
    
    //Boolean representing whether an equation was just solved, and the screen is showing the answer
    var displayingResultOfAnEquation = false;
    
    
    //A constant set to an arbitrary value, representing an error in unwraping an optional
    let ERROR = 99999.0
    
    //A constant to account for an offset for a specific case
    let OFFSET_TO_ACCOUNT_FOR_THE_APPENDED_EQUAL_SIGN_IN_ARRAY = 1
    
    @IBAction func zero(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("0")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("0")
    }
    
    @IBAction func one(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("1")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("1")
    }
    
    @IBAction func two(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("2")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("2")
    }
    
    @IBAction func three(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("3")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("3")
    }
    
    @IBAction func four(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("4")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("4")
    }
    
    @IBAction func five(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("5")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("5")
    }
    
    @IBAction func six(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("6")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("6")
    }
    
    @IBAction func seven(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("7")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("7")
    }
    
    
    @IBAction func eight(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
       //Display appropriate number
        viewWindow.documentView!.insertText("8")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("8")
    }
    
    
    @IBAction func nine(_ sender: NSButton) {
        //Clear display if last button pressed was an operator
        clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled()
        
        //Display appropriate number
        viewWindow.documentView!.insertText("9")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("9")
    }
    
    @IBAction func add(_ sender: NSButton) {
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Display appropriate math symbol
        viewWindow.documentView!.insertText("+")
        
        //Append number to array
        numsAndMathSymbolsAsIndividualCharectors.append("+")
    }
    
    @IBAction func subtract(_ sender: NSButton) {
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
    
    
    @IBAction func clearAll(_ sender: NSButton) {
        //Erase arrays
        mathSymbols.removeAll()
        numsWhole.removeAll()
        numsAndMathSymbolsAsIndividualCharectors.removeAll()
        
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Clear results from last calculation
        newEvaluation = 0.0;
    }
    
    
    @IBAction func equalitySign(_ sender: NSButton) {
        var combineDidgitsIntoNumber = ""
        
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //Edgecase: If user enters only 1 number and then clicks the equal sign, show that answer
        var containsOperator = 0;
        var arrayContents_tmpVar = "";
        for element in numsAndMathSymbolsAsIndividualCharectors { //Check if any opoerators were pressed
            if(element == "+" || element == "-" || element == "*" || element == "/") {
                containsOperator = 1
                break
            }
            else {
                arrayContents_tmpVar.append(element)
            }
        }
        if(containsOperator != 1) { //If no operators pressed this is one number- display that number. No further action needed.
            newEvaluation = Double(Int(arrayContents_tmpVar)!)
            //Clear viewWindow
            viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
            
            //Show result in viewWindow
            viewWindow.documentView!.insertText("\(newEvaluation)")
            
            displayingResultOfAnEquation = true
            return
        }
        
        //Append an equal sign at the end for parsing purposes
        numsAndMathSymbolsAsIndividualCharectors.append("=")
        
        //Loop through and parse the array that was created from the user's input, and concatenate didgits into a whole number e.g. 2,6,4 should become 264
        for numSymChar in numsAndMathSymbolsAsIndividualCharectors {
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
                var convToDouble: Double = Double(combineDidgitsIntoNumber) ?? ERROR
                //Add to array
                print("Adding \(convToDouble)")
                numsWhole.append(convToDouble)
                //Add operator to array
                mathSymbols.append("+")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
                
            case "-":
                //When hitting operator, convert combined number to int
                var convToDouble: Double = Double(combineDidgitsIntoNumber) ?? ERROR
                //Add to array
                numsWhole.append(convToDouble)
                //Add operator to array
                mathSymbols.append("-")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
            case "*":
                //When hitting operator, convert combined number to int
                var convToDouble: Double = Double(combineDidgitsIntoNumber) ?? ERROR
                //Add to array
                numsWhole.append(convToDouble)
                //Add operator to array
                mathSymbols.append("*")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
            case "/":
                //When hitting operator, convert combined number to int
                var convToDouble: Double = Double(combineDidgitsIntoNumber) ?? ERROR
                //Add to array
                numsWhole.append(convToDouble)
                //Add operator to array
                mathSymbols.append("/")
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
            case "=":
                //When hitting operator, convert combined number to int
                var convToDouble: Double = Double(combineDidgitsIntoNumber) ?? ERROR
                //Add to array
                numsWhole.append(convToDouble)
                //Clear combineDidgitsIntoNumber
                combineDidgitsIntoNumber.removeAll()
                
            default:
                print("An error occured")
            }
        }
        
        var evaluationSoFar = Stack()
        evaluationSoFar.push(intToPush: numsWhole[0]) //Create stack and start out with first value for sum/subtracting/multiplying/dividing algorithm
        
        //(e.g. 43 + 5)
        for i in 0...(numsWhole.capacity - 2) {

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

                    continue
                case "-":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Subtract evaluation so far, plus next number
                    newEvaluation = (value - self.numsWhole[i + 1])
                    evaluationSoFar.push(intToPush: newEvaluation)

                    continue
                case "*":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Multiply evaluation so far, plus next number
                    newEvaluation = (value * self.numsWhole[i + 1])
                    //Add new evaluation to stack
                    evaluationSoFar.push(intToPush: newEvaluation)

                    continue
                case "/":
                    //Fetch latest value and pop off stack
                    let value = evaluationSoFar.pop()!
                    //Divide evaluation so far, plus next number
                    newEvaluation = (value / self.numsWhole[i + 1])
                    evaluationSoFar.push(intToPush: newEvaluation)

                    continue
                    
                    
                default: //Is a number- skip
                    continue
                }
            }
        }
        //Erase stack and arrays
        evaluationSoFar.pop()
        mathSymbols.removeAll()
        numsWhole.removeAll()
        numsAndMathSymbolsAsIndividualCharectors.removeAll()
        
        //Clear viewWindow
        viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
        
        //show result in viewWindow
        //Display appropriate number
        viewWindow.documentView!.insertText("\(newEvaluation)")
        
        displayingResultOfAnEquation = true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Disable window resize
        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height);
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func clearDisplayIfLastButtonWasOperatorOrIfAnEqWasJustEvaled() {
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
        
        //If an equation was just solved, and the screen shows the answer, clear the screen
        if(displayingResultOfAnEquation) {
            //Clear viewWindow
            viewWindow.documentView?.deleteToBeginningOfLine((Any).self)
            
            //Set boolean back to false
            displayingResultOfAnEquation = false
        }
    }


}

