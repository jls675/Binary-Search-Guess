//
//  ViewController.swift
//  Binary Guess
//
//  Created by Jorge Sanchez on 1/25/19.
//  Copyright © 2019 Jorge Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var goAhead = false
    var max: Int = 1000
    var min: Int = 1
    var mG: Int!
    var userNumber: Int!
    var uNumTrack: String = ""
    
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var machineGuess: UILabel!
    @IBOutlet weak var currentNumber: UILabel!
    @IBOutlet weak var userInput: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialStatus()
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        uNumTrack = ""
        currentNumber.text = nil
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        if goAhead == true {
            if Int(uNumTrack)! > min && Int(uNumTrack)! < max {
                userNumber = Int(uNumTrack)
                clearButton.isHidden = true
                goButton.isHidden = true
                plusButton.isHidden = false
                minusButton.isHidden = false
                userInput.text = "Your number: \(uNumTrack)"
                mG = getMG()
                machineGuess.text = "machineGuess: \(String(mG))"
                
                disableNumberPad()
                
                if userNumber == mG {
                    currentNumber.text = "The two numbers are the same"
                    displayWIN()
                }
            }
        }
    }
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        goAhead = true
        uNumTrack += String(sender.tag - 1)
        currentNumber.text = uNumTrack
    }
    
    
    @IBAction func signalButtonPressed(_ sender: UIButton) {
        if sender.tag == 11 {
            max = mG
        }
        else if sender.tag == 12 {
            min = mG
        }
        
        mG = getMG()
        
        machineGuess.text = "machineGuess: \(String(mG))"
        
        //win or loss conditions
        if userNumber == mG {
            
            currentNumber.text = "You Won"
            displayWIN()
            
        }
        else if max - 1 == min || max == min - 1 {
            
            currentNumber.text = "You lost"
            displayLOSS()
            
        }
    }
    
    func getMG()->Int {
        return (min + max) / 2
    }
    
    func disableNumberPad() {
        zeroButton.isEnabled = false
        oneButton.isEnabled = false
        twoButton.isEnabled = false
        threeButton.isEnabled = false
        fourButton.isEnabled = false
        fiveButton.isEnabled = false
        sixButton.isEnabled = false
        sevenButton.isEnabled = false
        eightButton.isEnabled = false
        nineButton.isEnabled = false
        
    }
    
    func enableNumberPad() {
        zeroButton.isEnabled = true
        oneButton.isEnabled = true
        twoButton.isEnabled = true
        threeButton.isEnabled = true
        fourButton.isEnabled = true
        fiveButton.isEnabled = true
        sixButton.isEnabled = true
        sevenButton.isEnabled = true
        eightButton.isEnabled = true
        nineButton.isEnabled = true
    }
    
    func initialStatus() {
        
        goAhead = false
        machineGuess.text = nil
        userInput.text = "select a number between \(min) and \(max)"
        minusButton.isHidden = true
        plusButton.isHidden = true
        currentNumber.text = nil
        
    }
    
    func displayWIN() {
        let title = "You Won"
        let message = "Awesome the Machine Guess and your guess are the same"
        
        alertUi(titleIN: title, messageIN: message)
    }
    
    func displayLOSS() {
        let title = "You Lost"
        let message = "Tough, seems like you don't know the difference between \("<") and \(">")"
        
        alertUi(titleIN: title, messageIN: message)
    }
    
    func alertUi(titleIN: String, messageIN: String) {
        
        //UIAlert pop up
        
        let alert = UIAlertController(title: titleIN, message: messageIN, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.reset()
        }
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func reset() {
        
        max = 1000
        min = 1
        uNumTrack = ""
        
        initialStatus()
        enableNumberPad()
        
        clearButton.isHidden = false
        goButton.isHidden = false
        
    }
    
}

