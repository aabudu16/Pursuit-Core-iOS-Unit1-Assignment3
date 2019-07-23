//
//  main.swift
//  Calculator
//
//  Created by Ayoola Abudu on 07/21/19.
//

import Foundation



var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
                                                          "-": { $0 - $1 },
                                                          "*": { $0 * $1 },
                                                          "/": { $0 / $1 }]



func calculator () {
    print("Enter a calculation, 1 (regular) or 2 (higer order)")
    if let userInput = readLine(){
    
    if userInput == "1" {
        
        // this function loops through the Operations Dictionary and compares the input sysmbol to all the keys in the dictionary. If the key and sysmbols are a match, the function will perform the math operation that is associated with the key. and print it out to the console.
        func calculate (){
            print("Enter your operations e.g 5 + 3")
            print()
            print("Enter your first number")
            let input1:Double = Double(readLine()!)!
            print("Enter an operator (+, -, *, /)")
            let symbol:String = String(readLine()!)
            print("Enter your first number")
            let input2:Double = Double(readLine()!)!
            
            
            var result = Double()
            for i in operations{
                if i.key == symbol{
                    result = i.value(input1, input2)
                    print("\(input1) \(symbol) \(input2) = \(result)")
                    print("Would you like to play again (yes/no)")
                    let answer = readLine()
                    if answer == "yes"{
                     return
                    }else if answer == "no"{
                        print("Thanks for playing")
                        break
                    }
                }else {
                    if operations.keys.contains(symbol) != true {
                        print("Unknown operator: \(symbol)")
                        break
                    }
                }
            }
        }
        calculate()
    }else if userInput == "2"{
        
        func randomMath (){
            
            print("Press ? to pla a random calculation game..")
            let symbol = readLine()
            let questionMark = "?"
            if symbol == questionMark {
                let sign = operations.keys.randomElement()
                let firstNum = Int.random(in: 0...100)
                let secondNum = Int.random(in: 0...100)
                var result = Double()
                
                switch sign{
                case "+":
                    result =  Double( firstNum + secondNum)
                    print("\(firstNum) ? \(secondNum) = \(result)")
                case "-":
                    result =  Double( firstNum - secondNum)
                    print("\(firstNum) ? \(secondNum) = \(result)")
                case "*":
                    result =  Double( firstNum * secondNum)
                    print("\(firstNum) ? \(secondNum) = \(result)")
                case "/":
                    result =  Double( firstNum / secondNum)
                    print("\(firstNum) ? \(secondNum) = \(result)")
                default:
                    print()
                }
                
            }
            
        }
        randomMath()
    }
}
}
calculator()

