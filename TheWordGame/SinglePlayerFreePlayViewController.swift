//
//  SinglePlayerFreePlayViewController.swift
//  TheWordGame
//
//  Created by Rio Lynk on 4/12/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import UIKit

class SinglePlayerFreePlayViewController: UIViewController, UITextFieldDelegate {
    
    //declares labels that show the words
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var lastWord1: UILabel!
    @IBOutlet weak var lastWord2: UILabel!
    @IBOutlet weak var lastWord3: UILabel!
    @IBOutlet weak var logMessage: UILabel!
    
    var currentGame: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentGame == nil {
            currentGame = Game(startWord: "word")
        }
        
        currentWord.text = currentGame.currentWord
        let uw = currentGame.usedWords
        lastWord1.text = uw[uw.count - 2]
        lastWord2.text = uw[uw.count - 3]
        lastWord3.text = uw[uw.count - 4]

        logMessage.text = currentGame.logMessage
        wordInput.text = ""
        
        wordInput.returnKeyType = UIReturnKeyType.Done;
        wordInput.becomeFirstResponder()
        wordInput.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // If the user played a valid word on the current word...
        if currentGame.isValidPlay(wordInput.text, onWord:currentGame.currentWord) {
            // Clear the game's log message
            currentGame.updateGame(wordInput.text)
            
            // Clear the display log
            logMessage.text = ""
            
            // Set the displayed current word to the word entered by the user
            currentWord.text = currentGame.currentWord
            
            // Update the trail words to show the last 3 words played
            let uw = currentGame.usedWords
            lastWord1.text = uw[uw.count - 2]
            lastWord2.text = uw[uw.count - 3]
            lastWord3.text = uw[uw.count - 4]
            
            // Display the game's word count
            /* IMPLEMENT */
        }
        // User did NOT play a valid word on the current word
        else {
            // Display the game's log message
            logMessage.text = currentGame.logMessage
            
        }
        // Clear the input text box
        wordInput.text = ""
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
