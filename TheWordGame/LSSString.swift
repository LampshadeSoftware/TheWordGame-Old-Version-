//
//  LSSString.swift
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/14/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import Foundation

class LSSString {
    private var string: String!
    
    init(string: String) {
        self.string = string
    }
    
    func test (left: LSSString, right: LSSString) -> LSSString {
        return LSSString(string: left.string + right.string)
    }
    
    func getRawString() -> String {
        return string;
    }
    func charAt(index: Int) -> Character {
        return string[advance(string.startIndex, index)]
    }
    func equals(otherString: String) -> Bool {
        return string == otherString
    }
    func equals(otherString: LSSString) -> Bool {
        return string == otherString.string
    }
    func equalsIgnoreCase(otherString: String) -> Bool {
            var myLowercase = string.lowercaseString
            var otherLowercase = otherString.lowercaseString
            return myLowercase == otherLowercase
    }
    func equalsIgnoreCase(otherString: LSSString) -> Bool {
        var myLowercase = string.lowercaseString
        var otherLowercase = otherString.string.lowercaseString
        return myLowercase == otherLowercase
    }
    func indexOf(char: Character) -> Int {
        for var i = 0; i < countElements(string); i++ {
            if charAt(i) == char {
                return i
            }
        }
        return -1
    }
    func length() -> Int {
        return countElements(string)
    }
    
    func append(otherString: LSSString) -> LSSString {
        return LSSString(string: string + otherString.string)
    }
    func append(otherString: String) -> LSSString {
        return LSSString(string: string + otherString)
    }
    
}

