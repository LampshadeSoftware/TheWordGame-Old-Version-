//
//  Game.swift
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/12/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import Foundation

class Game {
    var currentWord: String!
    var wordCount: Int!
    var usedWords = [String]()

    var logMessage: String!
    

    func isValidPlay(newWord: String, currentWord: String) -> Bool {
        // Updates to the log message to a default message if it is not changed throughout this method
        logMessage = "Invalid play!";
        
        
        // If the new word is blank...
        if newWord == "" {
            logMessage = "You didn't type anything.";
            return false;
        }
        
        // If the new word is "fjord"...
        if newWord == "fjord" {
            logMessage = "You know goddamn well what you did";
            return false;
        }
        
        // Cycles through all the words in the usedWords array
        for word in usedWords {
            if(word == newWord) {
                logMessage = "\(word) has already been played";
                return false;
            }
        }
        // If the new word is a valid addition, subtraction, or swap on the current word...
        if isValidAdd(newWord, currentWord: currentWord) || isValidSub(newWord, currentWord: currentWord) || isValidExc(newWord, currentWord: currentWord) {
            if Dictionary.isEnglishWord() {
                var lastWord = usedWords[usedWords.count - 2]
                if isValidAdd(newWord, currentWord: lastWord) || isValidSub(newWord, currentWord: lastWord) || isValidExc(newWord, currentWord: lastWord) {
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
    
    func isValidAdd(newWord: String, currentWord: String) -> Bool {
        // If the new word is not only one letter longer than the current word...
        if countElements(newWord) != countElements(currentWord) + 1 {
            // Cannot be a valid addition
            return false;
        }
        
        var indexOfNewChar = -1
        for var i=0; i<countElements(currentWord); i++ {
            if charAt(newWord, index: i) == charAt(currentWord, index: i) {
                indexOfNewChar = i;
                break;
            }
        }
        
        
        // If the index variable remains unchanged...
        if indexOfNewChar == -1 {
            // The new character must be at the end of the word, so we can assume that for everything in this block.
            // Set the variable to the last index of the new word
            indexOfNewChar = countElements(newWord) - 1;
            
            // If the added character is an 's'...
            if charAt(newWord, index:indexOfNewChar) == "s" {
                logMessage = "Cannot simply add 's'"
                return false
            }
        
            // If the last letter of the current word was 'e', and the user added a 'd' to the end...
            if charAt(newWord, index:indexOfNewChar-1) == "e" && charAt(newWord, index: indexOfNewChar) == "d" {
                logMessage = "Cannot simply make verb past tense"
                return false
            }
        }
        
        // If the rest of the word is the same after the added letter...
        if restOfWordIsSame(newWord, currentWord: currentWord, index: indexOfNewChar, offset: 1) {
            return true
        }
        
        
        return false;
    }
    
    func isValidSub(newWord: String, currentWord: String) -> Bool {
        // If the new word is not only one letter less than the current word...
        if (countElements(newWord) != countElements(currentWord) - 1) {
            // Cannot be valid subtraction
            return false;
        }
        
        // A variable to store the original index of the character that has been deleted
        var indexOfDeletedChar = -1;
        // Cycles through the indexes of the current word
        for var i = 0; i < countElements(currentWord); i++ {
            // If the character in the new word at the current index is not equal to the
            // character in the current word at the current index...
            if (charAt(newWord, index: i) != charAt(currentWord, index: i)) {
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
            indexOfDeletedChar = countElements(currentWord) - 1;
        }
        
        // If the rest of the word is the same after the deleted character...
        if restOfWordIsSame(newWord, currentWord: currentWord, index: indexOfDeletedChar-1, offset: -1) {
            return true
        }

        return false
    }
    
    func isValidExc(newWord: String, currentWord: String) -> Bool {
        // If the new word and the current word do not have equal lengths...
        if countElements(newWord) != countElements(currentWord) {
            // Cannot be valid swap
            return false
        }
        
        // A variable to store the original index of the character that has been deleted
        var indexOfSwappedChar = -1;
        // Cycles through the indexes of the new word
        // (Both words have the same length, so it doesn't actually matter which one we cycle through)
        for var i = 0; i < countElements(newWord); i++ {
            // If the character in the new word at the current index is not equal to the
            // character in the current word at the current index...
            if charAt(newWord, index: i) != charAt(currentWord, index: i) {
                // Set the variable to the index
                indexOfSwappedChar = i;
                // Stop the search
                break;
            }
        }
        
        // If the index variable was changed, and the rest of the word is the same after the swapped character...
        if indexOfSwappedChar != -1 && restOfWordIsSame(newWord, currentWord: currentWord, index: indexOfSwappedChar, offset: 0) {
            return true
        }
        
        return false
    }
    
    func restOfWordIsSame(newWord: String, currentWord: String, index: Int, offset: Int) -> Bool {
        for var i = index + 1; i < countElements(newWord); i++ {
            if charAt(newWord, index: i) != charAt(currentWord, index: i - offset) {
                return false
            }
        }
        return true
    }
    
    private func charAt(str: String, index: Int) -> Character {
        return str[advance(str.startIndex, index)]
    }

}