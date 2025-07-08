//
//  AddPhraseView.swift
//  talksy
//
//  Created by Caio Santos on 07/07/25.
//


import SwiftUI

struct AddPhraseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var english: String = ""
    @State private var portuguese: String = ""
    var onAdd: (Phrase) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nova Frase")) {
                    TextField("Inglês", text: $english)
                    TextField("Português", text: $portuguese)
                }
            }
            .navigationTitle("Adicionar Frase")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Adicionar") {
                        let newPhrase = Phrase(id: UUID(), english: english, portuguese: portuguese)
                        onAdd(newPhrase)
                        dismiss()
                    }
                    .disabled(english.isEmpty || portuguese.isEmpty)
                }
            }
        }
    }
}
