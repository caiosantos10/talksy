//
//  DecksView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import SwiftUI

struct DecksView: View {
    @State private var decks: [Deck] = [
        Deck(
           id: UUID(),
           title: "Saudações",
           description: "Cumprimente pessoas",
           phrases: [
               Phrase(id: UUID(), english: "Hello!", portuguese: "Olá!"),
               Phrase(id: UUID(), english: "How are you?", portuguese: "Como você está?"),
               Phrase(id: UUID(), english: "Good morning!", portuguese: "Bom dia!")
           ]
       ),
       Deck(
           id: UUID(),
           title: "Viagem",
           description: "Frases úteis para viagens",
           phrases: [
               Phrase(id: UUID(), english: "Where is the hotel?", portuguese: "Onde fica o hotel?"),
               Phrase(id: UUID(), english: "I need a taxi.", portuguese: "Eu preciso de um táxi.")
           ]
       )

    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                List {
                    ForEach(decks) { deck in
                        NavigationLink(destination: DeckPhrasesView(deck: deck)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(deck.title)
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                Text(deck.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Meus Decks")
        }
    }
}

#Preview {
    DecksView()
}
