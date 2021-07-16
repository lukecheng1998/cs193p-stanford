//
//  MemoryGame.swift
//  Memorize
//
//  Created by Luke Cheng on 6/3/21.
//

import Foundation
//Model
struct MemoryGame <CardContent> where CardContent : Equatable {
    //Example of how variables are declared
    private(set) var cards : Array<Card>
    
    //game logic
    private var indexOfTheOneAndOnlyFaceUpCard : Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    //the _ represents no external name for it. Also example of how a function is used
    mutating func choose(_ card: Card){
        //Could crash the app with an exclamation point
        //if let chosenIndex = index(of: card){ old
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    mutating func shuffle() {
        cards.shuffle()
    }
    //automatically initializes the cards
    init(numberOfPairsOfCards : Int, createCardContent: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    //Embedded struct. Actual name is called MemoryGame.Card, but shortened
    //Nesting this, this is a memory game card
    struct Card : Identifiable{
        
        var isFaceUp = false
        var isMatched = false
        
        //Abstract variable for this
        let content : CardContent
        //Identifiable
        let id: Int
    }
}

extension Array {
    var oneAndOnly : Element? {
        if count == 1{
            return first
        }else{
            return nil
        }
    }
}
