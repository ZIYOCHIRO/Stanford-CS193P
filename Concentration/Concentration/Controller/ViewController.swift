//
//  ViewController.swift
//  Concentration
//
//  Created by ziyochiro on 2019/7/13.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = ConcentrationRule(numberOfPairsOfCards: numberOfPairsOfCards )
    
    var numberOfPairsOfCards: Int {
        get {
            return (flipCards.count + 1) / 2
        }
        
        // or just return (flipCards.count + 1) / 2
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var flipCards: [UIButton]!
    private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "FlipCount: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction private func flipCard(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = flipCards.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
            
        }
        
    }
    
    private func updateViewFromModel() {
        for index in flipCards.indices {
            let button = flipCards[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(withEmoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
        
       
        let x: (word: String, number: Int, value: Double) =  ("hello", 5, 0.85)
        print(x.word)
        print(x.number)
        print(x.value)

    }
    
    private var emojiCollection = ["👻","🎃","🍕","🍞","🧀","🍔","🥪","🌭","🌮"]
    private var emoji = [Int: String]()
    private func withEmoji(for Card: Card) -> String {
        if emoji[Card.identifier] == nil, emojiCollection.count > 0 {
            emoji[Card.identifier] = emojiCollection.remove(at: emojiCollection.count.arc4random)
            
        }
        let chosenEmoji = emoji[Card.identifier]
        return chosenEmoji ?? "?"
    }

 
}

extension Int {
    
    /// 生成0...upperBound的随机数
    var arc4random: Int {
        get {
            if self > 0 {
                return Int(arc4random_uniform(UInt32(self)))
            } else if self < 0 {
                return -Int(arc4random_uniform(UInt32(abs(self))))
            } else {
                return 0
            }
        }
    }
}

