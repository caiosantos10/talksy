//
//  DeckPhrasesView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import SwiftUI

struct DeckPhrasesView: View {
    var deck: Deck

    var body: some View {
        List(deck.phrases) { phrase in
            VStack(alignment: .leading) {
                Text(phrase.english)
                    .font(.headline)
                Text(phrase.portuguese)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
        .navigationTitle(deck.title)
    }
}

#Preview {
    let samplePhrases = [
        Phrase(id: UUID(), english: "Hello!", portuguese: "Olá!"),
        Phrase(id: UUID(), english: "How are you?", portuguese: "Como você está?")
    ]
    let sampleDeck = Deck(id: UUID(), title: "Saudações", description: "Cumprimente pessoas", phrases: samplePhrases)
    return DeckPhrasesView(deck: sampleDeck)
}
