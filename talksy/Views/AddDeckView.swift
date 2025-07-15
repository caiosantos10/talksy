//
//  AddDeckView.swift
//  talksy
//
//  Created by Caio Santos on 07/07/25.
//


import SwiftUI

struct AddDeckView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @State private var title: String = ""
    @State private var description: String = ""
    var onAdd: (Deck) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Novo Deck")) {
                    TextField("Título", text: $title)
                    TextField("Descrição", text: $description)
                }
            }
            .navigationTitle("Adicionar Deck")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar") {
                        let newDeck = Deck(id: UUID(), title: title, details: description, phrases: [])
                        context.insert(newDeck)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
