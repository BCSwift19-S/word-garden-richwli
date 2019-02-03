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
    
    var maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    
    //Functions
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
    
    func findAndInsert() {
        var revealedWord = ""
        lettersGuessed += userLetterSelectField.text!
        for letter in wordToGuess{
            if(lettersGuessed.contains(letter)){
                revealedWord+="\(letter) "
            }else{
                revealedWord += "_ "
            }
        }
        revealedWord.removeLast()
        guessFillLabel.text = revealedWord
    }
    
    func guessALetter(){
        findAndInsert()
        guessCount += 1
        let currentLetterGuessed = userLetterSelectField.text!
        if !wordToGuess.contains(currentLetterGuessed){
            wrongGuessesRemaining -= 1
            flowerPicture.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = guessFillLabel.text!
        if(wrongGuessesRemaining==0){
            //You lose
            playAgainBut.isHidden = false
            userLetterSelectField.isEnabled = false
            guessThisLetterBut.isEnabled = false
            guessCountLabel.text = "So sorry, but you are alllllll out of guesses. :("
            
        }else if (!revealedWord.contains("_") ){
            //You win
            playAgainBut.isHidden = false
            userLetterSelectField.isEnabled = false
            guessThisLetterBut.isEnabled = false
            guessCountLabel.text = "You won!!! It only took you \(guessCount) tries!!!"
        }else{
            //Update guess count label
            let guess = ( guessCount == 1 ?
                "guess" : "guesses" )
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
        }
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
        guessALetter()
        updateUIAfterGuess()
        guessThisLetterBut.isEnabled = false
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
        guessThisLetterBut.isEnabled = false
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        playAgainBut.isHidden = true
        userLetterSelectField.isEnabled = true
        guessThisLetterBut.isEnabled = false
        flowerPicture.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        findAndInsert()
        guessCountLabel.text = "You've made 0 guesses."
        guessCount = 0
    }
}

