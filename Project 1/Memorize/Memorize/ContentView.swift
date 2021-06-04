//
//  ContentView.swift
//  Memorize
//
//  Created by Luke Cheng on 5/31/21.
//

import SwiftUI
//View
struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        // variable type: behavior type
        ScrollView {
            LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(viewModel.cards) {card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
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
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                //bag of views, conditional, and variables
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched {
                shape.opacity(0)
            }else{
                shape.fill()
            }
                        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
