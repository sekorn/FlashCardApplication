//
//  CardDeck.swift
//  FlashCardApplication
//
//  Created by Scott Kornblatt on 9/29/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation

class CardDeck {
    
    var cards:[Card] = []
    var card:Card!
    
    init() {
        for x in 1...20 {
            card = Card()
            card.question = "\(x) x 15"
            cards.append(card)
        }
    }
}
