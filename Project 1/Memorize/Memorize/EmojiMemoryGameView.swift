//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luke Cheng on 5/31/21.
//

import SwiftUI
//View
struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        // variable type: behavior type
        ScrollView {
            LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(game.cards) {card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        //Complex Collection of views
        .padding(.horizontal)


    }//LEGO
    
}

struct CardView: View {
    //var content: String
    //isFaceUp checks for the card facing up or down
    //@State var isFaceUp : Bool = true
    
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp{
                    //bag of views, conditional, and variables
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                }else if card.isMatched {
                    shape.opacity(0)
                }else{
                    shape.fill()
                }
            }
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
