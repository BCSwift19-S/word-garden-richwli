//
//  ViewController.swift
//  Word Garden
//
//  Created by BC Swift Student Loan 1 on 1/30/19.
//  Copyright © 2019 Richard Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var flowerPicture: UIImageView!
    @IBOutlet weak var guessFillLabel: UILabel!
    @IBOutlet weak var userLetterSelectField: UITextField!
    @IBOutlet weak var guessThisLetterBut: UIButton!
    @IBOutlet weak var playAgainBut: UIButton!
    
    func updateUIAfterGuess(){
        userLetterSelectField.resignFirstResponder()
        userLetterSelectField.text = ""
         print("UI has been updated.")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guessThisLetterBut.isEnabled = false
        playAgainBut.isHidden = true
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        print("The guessedLetterFieldChanged has been updated.")
        if let letterGuessed = userLetterSelectField.text?.last{
            userLetterSelectField.text = "\(letterGuessed)"
            guessThisLetterBut.isEnabled = true
        }else{
             guessThisLetterBut.isEnabled = false
        }
    }
    
    @IBAction func guessThisLetterButton(_ sender: UIButton) {
        //updates if button is pressed
        updateUIAfterGuess()
        guessThisLetterBut.isEnabled = false
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
        guessThisLetterBut.isEnabled = false
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
    }
}

