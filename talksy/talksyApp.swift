//
//  talksyApp.swift
//  talksy
//
//  Created by Caio Santos on 02/07/25.
//

import SwiftUI
import SwiftData

@main
struct talksyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Deck.self, Phrase.self])
    }
}
