//
//  Dictionary.swift
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/12/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import Foundation

class Dictionary {
    
    var dictionary:Array<String>!
    
    class func initialize() -> Void {
        println("Dictionary initialized")
    }
    
    class func isEnglishWord() -> Bool {
        return true;
    }
}