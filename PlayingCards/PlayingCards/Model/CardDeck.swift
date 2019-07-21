//
//  CardDeck.swift
//  PlayingCards
//
//  Created by ziyochiro on 2019/7/20.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation

struct CardDeck {
    
    private(set) var cards = [Card]()
    
    init() {
        for suit in Card.Suit.all {
            for rank in Card.Rank.all {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4Random)
        } else {
            return nil
        }
    }
    
    
}

extension Int {
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
