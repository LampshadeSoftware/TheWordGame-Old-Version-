//
//  Game.swift
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/12/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import Foundation

class Game {
    var currentWord: NSString!
    var wordCount: Int!
    var usedWords: [NSString]!
    var logMessage: NSString!
    
    init(startWord: String) {
        currentWord = startWord
        wordCount = 0
        logMessage = ""
        usedWords = ["", "", "", currentWord]
    }
    
    func updateGame(newCurrentWord: String) {
        currentWord = newCurrentWord
        usedWords.append(currentWord)
        logMessage = ""
        wordCount = wordCount + 1
    }
    
    
    func isValidPlay(newWord: NSString, onWord currentWord: NSString) -> Bool {
        // Updates to the log message to a default message if it is not changed throughout this method
        logMessage = "Invalid play"
        
        // If the new word is blank...
        if newWord.isEqualToString("") {
            logMessage = "You didn't type anything"
            return false;
        }
        
        // If the new word is "fjord"...
        if newWord.isEqualToString("fjord") {
            logMessage = "You know goddamn well what you did"
            return false;
        }
        
        // Cycles through all the words in the usedWords array
        for word in usedWords {
            if(word.isEqualToString(newWord)) {
                logMessage = "\(word) has already been played"
                return false;
            }
        }
        // If the new word is a valid addition, subtraction, or swap on the current word...
        if isValidAdd(newWord, onWord: currentWord) || isValidSub(newWord, onWord: currentWord) || isValidExc(newWord, onWord: currentWord) {
            if englishDictionary.hasWord(newWord) {
                var lastWord = usedWords[usedWords.count - 2]
                if isValidAdd(newWord, onWord: lastWord) || isValidSub(newWord, onWord: lastWord) || isValidExc(newWord, onWord: lastWord) {
                    logMessage = "Double play!"
                    return false
                }
                return true
            }
            else {
                logMessage = "\(newWord) is not an English word."
            }
        }
        
        // Not valid play, default log message is used
        return false;
    }
    
    func isValidAdd(newWord: NSString, onWord currentWord: NSString) -> Bool {
        // If the new word is not only one letter longer than the current word...
        if newWord.length != currentWord.length + 1 {
            // Cannot be a valid addition
            return false;
        }
        
        var indexOfNewChar = -1
        for var i=0; i < currentWord.length; i++ {
            if newWord.characterAtIndex(i) != currentWord.characterAtIndex(i) {
                indexOfNewChar = i;
                break;
            }
        }
        
        // If the index variable remains unchanged...
        if indexOfNewChar == -1 {
            // The new character must be at the end of the word, so we can assume that for everything in this block.
            // Set the variable to the last index of the new word
            indexOfNewChar = newWord.length - 1;
            
            let s:unichar = ("s" as NSString).characterAtIndex(0)
            let e:unichar = ("e" as NSString).characterAtIndex(0)
            let d:unichar = ("d" as NSString).characterAtIndex(0)
            
            // If the added character is an 's'...
            if newWord.characterAtIndex(indexOfNewChar) == s {
                logMessage = "Cannot simply add 's'"
                return false
            }
        
            // If the last letter of the current word was 'e', and the user added a 'd' to the end...
            if newWord.characterAtIndex(indexOfNewChar - 1) == e && newWord.characterAtIndex(indexOfNewChar) == d {
                logMessage = "Cannot simply make verb past tense"
                return false
            }
        }
        
        // If the rest of the word is the same after the added letter...
        if restOfWordIsSame(newWord, to: currentWord, fromIndex: indexOfNewChar+1, withOffset: 1) {
            println("\(newWord) is a valid add on \(currentWord)")
            return true
        }
        
        
        return false;
    }
    
    func isValidSub(newWord: NSString, onWord currentWord: NSString) -> Bool {
        // If the new word is not only one letter less than the current word...
        if (newWord.length != currentWord.length - 1) {
            // Cannot be valid subtraction
            return false;
        }
        
        // A variable to store the original index of the character that has been deleted
        var indexOfDeletedChar = -1;
        // Cycles through the indexes of the current word
        for var i = 0; i < newWord.length; i++ {
            // If the character in the new word at the current index is not equal to the
            // character in the current word at the current index...
            if (newWord.characterAtIndex(i) != currentWord.characterAtIndex(i)) {
                // Set the variable to the index
                indexOfDeletedChar = i;
                // Stop search
                break;
            }
        }
        
        // If the variable remains unchanged...
        if indexOfDeletedChar == -1 {
            // The character must have been removed from the end of the current word.
            // Set the variable to the last index of the current word
            indexOfDeletedChar = currentWord.length - 1;
        }
        
        // If the rest of the word is the same after the deleted character...
        if restOfWordIsSame(newWord, to: currentWord, fromIndex: indexOfDeletedChar, withOffset: -1) {
            return true
        }

        return false
    }
    
    func isValidExc(newWord: NSString, onWord currentWord: NSString) -> Bool {
        // If the new word and the current word do not have equal lengths...
        if newWord.length != currentWord.length {
            // Cannot be valid swap
            return false
        }
        
        // A variable to store the original index of the character that has been deleted
        var indexOfSwappedChar = -1;
        // Cycles through the indexes of the new word
        // (Both words have the same length, so it doesn't actually matter which one we cycle through)
        for var i = 0; i < newWord.length; i++ {
            // If the character in the new word at the current index is not equal to the
            // character in the current word at the current index...
            if newWord.characterAtIndex(i) != currentWord.characterAtIndex(i) {
                // Set the variable to the index
                indexOfSwappedChar = i;
                // Stop the search
                break;
            }
        }
        
        // If the index variable was changed, and the rest of the word is the same after the swapped character...
        if indexOfSwappedChar != -1 && restOfWordIsSame(newWord, to: currentWord, fromIndex: indexOfSwappedChar+1, withOffset: 0) {
            return true
        }
        
        return false
    }
    
    func restOfWordIsSame(newWord: NSString, to currentWord: NSString, fromIndex index: Int, withOffset offset: Int) -> Bool {
        for var i = index; i < newWord.length; i++ {
            if(newWord.characterAtIndex(i) != currentWord.characterAtIndex(i - offset)) {
                return false
            }
        }
        return true
    }

}