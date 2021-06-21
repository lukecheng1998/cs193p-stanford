//
//  FlagMemoryGame.swift
//  Memorize
//
//  Created by Luke Cheng on 6/9/21.
//

import SwiftUI

class FlagMemoryGame: ObservableObject {
    static let flags = ["🏳️‍🌈", "🇦🇹", "🇨🇦", "🇺🇸", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇧", "🇰🇵", "🇲🇾", "🇸🇬", "🇭🇰", "🇪🇺", "🇭🇺", "🇫🇴", "🇫🇷", "🇯🇲", "🇮🇹", "🇲🇨", "🇼🇸", "🇿🇲", "🇻🇮"]
    static func createFlagMemoryGame() -> MemoryGame <String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){
            pairIndex in flags[pairIndex]
        }
    }
    //private (set) other models may look at the model but not change it
    @Published private var model: MemoryGame<String> = createFlagMemoryGame()
    
    //read only
    var cards : Array <MemoryGame<String>.Card> {
        model.cards
    }
    //MARK - Intent(s)
    
    func choose(_ card : MemoryGame<String>.Card){
        model.choose(card)
    }
}
