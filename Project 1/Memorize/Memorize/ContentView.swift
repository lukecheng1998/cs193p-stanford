//
//  ContentView.swift
//  Memorize
//
//  Created by Luke Cheng on 5/31/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚛", "🚄", "🚟", "🛵", "🚞", "🛶", "🛩", "🚜", "🏎", "🚢", "🚔", "🚁", "🚊", "🚅", "🛫", "🚇", "🚲", "🚍", "🛺"]
    var faces = ["😃", "😁", "🥲", "🤓", "🥰", "🤓", "🧐", "🤨", "😔", "😎", "🥸", "🥳", "🤩", "😡", "😤", "🤯", "😐", "🥺", "😞", "🥶"]
    @State var emojiCount = 4
    var body: some View {
        VStack{
        // variable type: behavior type
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        //Complex Collection of views
        .padding(.horizontal)


    }//LEGO
    
    var remove: some View {
        Button {
            if emojiCount > 1{
                emojiCount -= 1
            }
        } label: {
            
            Image(systemName: "minus.circle")
                
        }
    }
    var add: some View {
        Button {
            if(emojiCount < emojis.count){
                emojiCount += 1
            }
        } label: {
            
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    //isFaceUp checks for the card facing up or down
    @State var isFaceUp : Bool = true
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                //bag of views, conditional, and variables
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
                        
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
