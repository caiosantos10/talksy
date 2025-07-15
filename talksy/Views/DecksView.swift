//
//  DecksView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//

import SwiftUI
import SwiftData

struct DecksView: View {
    @State private var showingAddDeck = false
    @Environment(\.modelContext) private var context
    @Query(sort: \Deck.title) private var decks: [Deck]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                List {
                    ForEach(decks) { deck in
                        NavigationLink(destination: DeckPhrasesView(deck: deck)) {
                            DeckRow(deck: deck)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Meus Decks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddDeck = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddDeck) {
                AddDeckView(onAdd: { newDeck in
                    context.insert(newDeck)
                })
            }
        }
    }
}

// View auxiliar para resolver type-check
struct DeckRow: View {
    let deck: Deck

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(deck.title)
                .font(.headline)
                .foregroundColor(.blue)
            Text(deck.details) // <- certifique-se que o model usa esse nome!
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack(spacing: 4) {
                Image(systemName: "text.quote")
                    .foregroundColor(.gray)
                Text("\(deck.phrases.count) frases")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    DecksView()
}
