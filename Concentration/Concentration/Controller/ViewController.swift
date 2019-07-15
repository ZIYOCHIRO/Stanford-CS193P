//
//  ViewController.swift
//  Concentration
//
//  Created by ziyochiro on 2019/7/13.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = ConcentrationRule(numberOfPairsOfCards: (flipCards.count + 1) / 2 )
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var flipCards: [UIButton]!
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "FlipCount: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = flipCards.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
            
        }
        
    }
    
    func updateViewFromModel() {
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
    
    var emojiCollection = ["👻","🎃","🍕","🍞","🧀","🍔","🥪","🌭","🌮"]
    var emoji = [Int: String]()
    func withEmoji(for Card: Card) -> String {
        if emoji[Card.identifier] == nil, emojiCollection.count > 0 {
            
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emoji[Card.identifier] = emojiCollection.remove(at: randomIndex)
            
        }
        let chosenEmoji = emoji[Card.identifier]
        return chosenEmoji ?? "?"
    }

 
}

