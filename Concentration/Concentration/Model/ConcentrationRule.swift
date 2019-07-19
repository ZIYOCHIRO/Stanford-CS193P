//
//  ConcentrationRule.swift
//  Concentration
//
//  Created by ziyochiro on 2019/7/14.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation

class ConcentrationRule {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUp: Int? {
        get {
            // look at all cards and see if you find only one that's faced up
            // if so, return it, else return nil
            
            return cards.indices.filter { cards[$0].isFacedUp }.oneAndOnly
            
            /* solution 2
             let faceUpIndex = cards.indices.filter { cards[$0].isFacedUp }
             return faceUpIndex.count == 1 ? faceUpIndex.first : nil
             */
            
            
            
            /* solution 1
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
 
            */
        }
        set(newVaule) {
            //  case either no cards or two cards
            //  trun all the cards face down except the card at index newValue
            for index in cards.indices {
                cards[index].isFacedUp = (index == newVaule)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        // 如果选中的index不包含在cards.indices里，程序直接崩溃，并打印出后面的message
        assert(cards.indices.contains(index), "ConcentrationRule.chooseCard(at index: \(index): chosen index not in the cards.")
        // 选中的卡片没有匹配
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUp, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                // either no cards or two cards
                indexOfOneAndOnlyFacedUp = index
                
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "ConcentrationRule.init(\(numberOfPairsOfCards): You must have at least one pair of cards.")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // Shuffle the cards
        
        for _ in cards.indices {
            // swapAt(randomA, randomB)
            cards.swapAt((2 * numberOfPairsOfCards).arc4random, (2 * numberOfPairsOfCards).arc4random)
        }
        
    }
    
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
