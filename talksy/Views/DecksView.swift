//
//  DecksView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import SwiftUI

struct DecksView: View {
    @State private var decks: [Deck] = [
        Deck(id: UUID(), title: "Saudações Básicas", description: "Cumprimente pessoas e faça amizades"),
        Deck(id: UUID(), title: "Viagem", description: "Frases úteis para viagens"),
        Deck(id: UUID(), title: "Trabalho", description: "Vocabulário para o ambiente profissional")
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                List {
                    ForEach(decks) { deck in
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
                .listStyle(.plain)
            }
            .navigationTitle("Meus Decks")
        }
    }
}

#Preview {
    DecksView()
}
