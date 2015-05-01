//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Matt Grimes on 4/4/15.
//  Copyright (c) 2015 Daily Dram. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named:"")
    var name = ""
    var subSpecies = ""
    
    func roar() {
        println("Lion: roar roar")
    }
    
    func changeToAlphaMale() {
        self.isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact:String
        
        if self.isAlphaMale {
            randomFact = "Male lions are easy to recognize thanks to their distinctive manes"
        }
        else  {
            randomFact = "Female lionesses form the stable social unit and do not tolerate outside females"
        }
        
        return randomFact
    }
}

