//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Luke Cheng on 6/3/21.
//

import SwiftUI
//View Model
class EmojiMemoryGame : ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    //Global variable but within a class, like nesting card here
    static let emojis = ["✈️", "🚛", "🚄", "🚟", "🛵", "🚞", "🛶", "🛩", "🚜", "🏎", "🚢", "🚔", "🚁", "🚊", "🚅", "🛫", "🚇", "🚲", "🚍", "🛺"]

    static func createMemoryGame() -> MemoryGame <String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){
            pairIndex in emojis[pairIndex]
        }
    }
    //private (set) other models may look at the model but not change it
    @Published private var model = createMemoryGame()
    
    //read only
    var cards : Array <Card> {
        model.cards
    }
    //MARK - Intent(s)
    
    func choose(_ card : Card){
        model.choose(card)
    }
}
