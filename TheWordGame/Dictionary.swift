//
//  Dictionary.swift
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/12/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import Foundation

class Dictionary {
    
    let dictionary: Array<String>!
    
    init() {
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("Dictionary", ofType: "txt")
        
        // Define the contents of Dictionary.txt as a single string
        let entireDictionary = String(contentsOfFile: path!, encoding:NSUTF8StringEncoding, error:nil)
        
        dictionary = entireDictionary?.componentsSeparatedByString("\n")
        
        println("Dictionary initialized")

    }
    
    func hasWord(newWord: String) -> Bool {
        for word in dictionary {
            if word == newWord {
                return true
            }
        }
        return false
    }
}