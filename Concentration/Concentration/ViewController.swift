//
//  ViewController.swift
//  Concentration
//
//  Created by ziyochiro on 2019/7/13.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    var cardContents = ["👻","🎃","👻","🎃"]
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
            changeCardTitle(withEmoji: cardContents[cardIndex], on: sender)
        }
        
    }
    
    func changeCardTitle(withEmoji emoji: String, on Button: UIButton) {
        if Button.currentTitle == emoji {
            Button.setTitle("", for: .normal)
            Button.backgroundColor = UIColor.orange
        } else {
            Button.setTitle(emoji, for: .normal)
            Button.backgroundColor = UIColor.white
        }
    }
    
    
    
}

