//
//  Card.swift
//  PlayingCards
//
//  Created by ziyochiro on 2019/7/19.
//  Copyright © 2019 Rui. All rights reserved.
//

import Foundation

struct Card {
    var suit: Suit
    var rank: Rank
    
    
    enum Suit: String {
        case diamond = "♦"
        case spade = "♠"
        case heart = "❤"
        case club = "♣"
        
        static var all = [Suit.diamond, .spade, .heart, .club]
    }
    
    enum Rank {
        case ace
        case face(String)
        case numeric(pipsCount: Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank]  {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pipsCount: pips))
            }
            allRanks += [Rank.face("J"), face("Q"), face("K")]
            return allRanks
        }
        
    }
    
    
}
