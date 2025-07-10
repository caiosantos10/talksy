//
//  DeckPhrasesView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import SwiftUI

struct DeckPhrasesView: View {
    @Binding var deck: Deck
    
    @State private var showingAddPhrase = false
    
    @State private var showFlashcards = false

    var body: some View {
        List(deck.phrases) { phrase in
            NavigationLink(destination: FlashcardView(phrase: phrase)) {
                VStack(alignment: .leading) {
                    Text(phrase.english)
                        .font(.headline)
                    Text(phrase.portuguese)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
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
                deck.phrases.append(newPhrase)
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
        deck: .constant(
            Deck(
                id: UUID(),
                title: "Saudações",
                description: "Cumprimente pessoas",
                phrases: [
                    Phrase(id: UUID(), english: "Hello!", portuguese: "Olá!"),
                    Phrase(id: UUID(), english: "How are you?", portuguese: "Como você está?")
                ]
            )
        )
    )
}

