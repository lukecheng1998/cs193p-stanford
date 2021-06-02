//
//  ContentView.swift
//  Memorize
//
//  Created by Luke Cheng on 5/31/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "🚛", "🚄", "🚟", "🛵", "🚞", "🛶", "🛩", "🚜", "🏎", "🚢", "🚔", "🚁", "🚊", "🚅", "🛫", "🚇", "🚲", "🚍", "🛺"]
    @State var symbols = ["✝️", "💛", "❤️", "☯️", "🛑", "📛", "1️⃣", "🔢", "♿️", "🎵", "©️", "🔉", "㊙️", "💞", "🔱", "🈂️", "❇️", "🚼", "🈁", "✳️"]
    @State var objects = ["📱", "🎥", "⌛️", "🔦", "⏲", "🎛", "💵", "🔨", "🧱", "🔫", "💊", "🔮", "⚰️", "⚱️", "🔭", "🛏", "🧧", "📫", "🏷", "📆"]
    //Counts of emoji
    @State var emojiCount = Int.random(in: 8..<20)
    //Check for the which button has been pressed
    @State var emojiType = 0
    var body: some View {
        VStack{
        // variable type: behavior type
            titleText
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]){
                    if(emojiType == 0){
                        
                        ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }else if (emojiType == 1){
                        ForEach(symbols[0..<emojiCount], id: \.self) {face in
                            CardView(content: face).aspectRatio(2/3, contentMode: .fit)
                        }
                    }else{
                        ForEach(objects[0..<emojiCount], id: \.self) {object in
                            CardView(content: object).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                //remove
                emojiButton
                Spacer()
                //add
                faceButton
                Spacer()
                objectsButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        //Complex Collection of views
        .padding(.horizontal)


    }//LEGO
    
    //Title text for Memorize
    var titleText : some View {
        Text("Memorize!")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
    //Buttons to switch between the emoji types
    var emojiButton : some View {
        Button {
            emojiType = 0
            emojiCount = Int.random(in: 8..<20)
            emojis.shuffle()
        } label : {
            VStack{
                Image(systemName: "book.circle")
                Text("Vehicles").font(.footnote)
            }
        }
    }
    var faceButton : some View {
        Button {
            emojiType = 1
            emojiCount = Int.random(in: 8..<20)
            symbols.shuffle()
        } label : {
            VStack{
                Image(systemName: "character.book.closed")
                Text("Symbols").font(.footnote)
            }
        }
    }
    var objectsButton : some View {
        Button {
            emojiType = 2
            emojiCount = Int.random(in: 8..<20)
            objects.shuffle()
        } label : {
            VStack{
                Image(systemName: "bookmark")
                Text("Objects").font(.footnote)
            }
            
        }
    }
    //DEAD CODE
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
    //END DEAD
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
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.dark)
        }
        ContentView()
            .preferredColorScheme(.light)
    }
}
