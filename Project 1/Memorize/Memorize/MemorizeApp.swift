//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Luke Cheng on 5/31/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
