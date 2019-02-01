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
    
    func updateUIAfterGuess(){
        userLetterSelectField.resignFirstResponder()
        userLetterSelectField.text = ""
         print("UI has been updated.")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        print("The guessedLetterFieldChanged has been updated.")
    }
    
    @IBAction func guessThisLetterButton(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
    }
}

