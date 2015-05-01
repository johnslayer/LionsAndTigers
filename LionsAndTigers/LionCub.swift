//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Matt Grimes on 4/30/15.
//  Copyright (c) 2015 Daily Dram. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly () {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar() {
        
        super.roar()
        
        println("lioncub: Growl Growl")
    }
    override func randomFact() -> String {
        var randomFactString:String
        
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks"
        } else {
            randomFactString = "Cubs begin eating meat at about the age of 6 weeks"
        }
        return randomFactString
    }
}
