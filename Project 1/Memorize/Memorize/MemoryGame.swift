//
//  MemoryGame.swift
//  Memorize
//
//  Created by Luke Cheng on 6/3/21.
//

import Foundation
//Model
struct MemoryGame <CardContent> {
    //Example of how variables are declared
    private(set) var cards : Array<Card>
    
    //the _ represents no external name for it. Also example of how a function is used
    func choose(_ card: Card){
        
    }
    //automatically initializes the cards
    init(numberOfPairsOfCards : Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    //Embedded struct. Actual name is called MemoryGame.Card, but shortened
    //Nesting this, this is a memory game card
    struct Card {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        
        //Abstract variable for this
        var content : CardContent
    }
}
