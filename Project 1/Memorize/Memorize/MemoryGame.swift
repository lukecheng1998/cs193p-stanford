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
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
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
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
    }
    //automatically initializes the cards
    init(numberOfPairsOfCards : Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    //Embedded struct. Actual name is called MemoryGame.Card, but shortened
    //Nesting this, this is a memory game card
    struct Card : Identifiable{
        
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        
        //Abstract variable for this
        var content : CardContent
        //Identifiable
        var id: Int
    }
}
