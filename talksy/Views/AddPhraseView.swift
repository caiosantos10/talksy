//
//  AddPhraseView.swift
//  talksy
//
//  Created by Caio Santos on 07/07/25.
//


import SwiftUI

struct AddPhraseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var english: String
    @State private var portuguese: String
    var onAdd: (Phrase) -> Void

    // Novo init para permitir valores iniciais
    init(phrase: Phrase? = nil, onAdd: @escaping (Phrase) -> Void) {
        _english = State(initialValue: phrase?.english ?? "")
        _portuguese = State(initialValue: phrase?.portuguese ?? "")
        self.onAdd = onAdd
        self.editingPhrase = phrase
    }

    // Guardar frase original, se estiver editando
    private var editingPhrase: Phrase?

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(editingPhrase == nil ? "Nova Frase" : "Editar Frase")) {
                    TextField("Inglês", text: $english)
                    TextField("Português", text: $portuguese)
                }
            }
            .navigationTitle(editingPhrase == nil ? "Adicionar Frase" : "Editar Frase")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(editingPhrase == nil ? "Adicionar" : "Salvar") {
                        let id = editingPhrase?.id ?? UUID()
                        let newPhrase = Phrase(id: id, english: english, portuguese: portuguese)
                        onAdd(newPhrase)
                        dismiss()
                    }
                    .disabled(english.isEmpty || portuguese.isEmpty)
                }
            }
        }
    }
}
