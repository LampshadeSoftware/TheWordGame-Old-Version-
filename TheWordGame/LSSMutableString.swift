//
//  LSSMutableString.swift
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/16/15.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

import Foundation

class LSSMutableString : LSSString {
    

    override init(string: String) {
        super.init(string: string)
    }
    
    override func changeToString(string: String) {
        self.string = string
    }
    override func changeToString(string: LSSString) {
        self.string = string.getRawString()
    }
}