//
//  ConcentrationCard.swift
//  Concentration
//
//  Created by ziyochiro on 2019/7/14.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation


struct Card {
    
    var isFacedUp: Bool = false
    var isMatched: Bool = false
    var identifier: Int
    
    static var cardIdentifier: Int = 0
    
    static func getCardIdentifier() -> Int {
        cardIdentifier += 1
        return Card.cardIdentifier
        
    }
    
    init() {
        self.identifier = Card.getCardIdentifier()
    }
}
