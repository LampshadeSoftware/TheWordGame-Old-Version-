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
        let path: String = "~/Dictionary.txt".stringByExpandingTildeInPath
        // Define the contents of Dictionary.txt as a single string
        // let entireDictionary: String = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
        
        let str = "one two three four"
        let arr = str.componentsSeparatedByString(" ")
        
        println(arr)
        
        println("Dictionary initialized")

    }
    
    class func isEnglishWord() -> Bool {
        return true;
    }
}