//
//  ConcentrationRule.swift
//  Concentration
//
//  Created by ziyochiro on 2019/7/14.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation

class ConcentrationRule {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUp: Int?
    
    func chooseCard(at index: Int) {
        // 选中的卡片没有匹配
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUp, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUp = nil
            } else {
                // either no cards or two cards
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUp = index
                
            }
            
        }
 
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // Shuffle the cards
        
        for _ in cards.indices {
            let randomA = Int(arc4random_uniform(UInt32(2 * numberOfPairsOfCards - 1)))
            let randomB = Int(arc4random_uniform(UInt32(2 * numberOfPairsOfCards - 1)))
            cards.swapAt(randomA, randomB)
        }
        
    }
    
    
}
