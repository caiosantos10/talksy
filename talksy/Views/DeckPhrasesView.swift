//
//  DeckPhrasesView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import SwiftUI

struct DeckPhrasesView: View {
    var deck: Deck
    @State private var editingPhrase: Phrase? = nil
    @State private var showingAddPhrase = false
    @State private var showFlashcards = false
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            ForEach(deck.phrases) { phrase in
                HStack {
                    VStack(alignment: .leading) {
                        Text(phrase.english)
                            .font(.headline)
                        Text(phrase.portuguese)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button {
                        editingPhrase = phrase
                    } label: {}
                }
                .padding(.vertical, 8)
            }
            .onDelete { indices in
                deck.phrases.remove(atOffsets: indices)
            }
        }
        .navigationTitle(deck.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddPhrase = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddPhrase) {
            AddPhraseView { newPhrase in
                context.insert(newPhrase)  
                deck.phrases.append(newPhrase)
            }
        }
        .sheet(item: $editingPhrase) { phrase in
            AddPhraseView(phrase: phrase) { updatedPhrase in
                if let idx = deck.phrases.firstIndex(where: { $0.id == updatedPhrase.id }) {
                    deck.phrases[idx] = updatedPhrase
                }
            }
        }
        Button(action: {
            showFlashcards = true
        }) {
            HStack {
                Image(systemName: "rectangle.stack")
                Text("Estudar todas")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .sheet(isPresented: $showFlashcards) {
            NavigationStack {
                FlashcardsSessionView(phrases: deck.phrases)
            }
        }


    }
}

#Preview {
    DeckPhrasesView(
        deck: Deck(
            title: "Saudações",
            details: "Cumprimente pessoas",
            phrases: [
                Phrase(english: "Hello!", portuguese: "Olá!"),
                Phrase(english: "How are you?", portuguese: "Como você está?")
            ]
        )
    )
}


