//
//  FlashcardsSessionView.swift
//  talksy
//
//  Created by Caio Santos on 10/07/25.
//


import SwiftUI
import AVFoundation

struct FlashcardsSessionView: View {
    @Environment(\.dismiss) var dismiss
    let phrases: [Phrase]
    @State private var currentIndex: Int = 0
    @State private var showTranslation = false

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            // Card
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(radius: 8)
                    .frame(height: 220)
                    .onTapGesture {
                        withAnimation {
                            showTranslation.toggle()
                        }
                    }

                if !phrases.isEmpty {
                    Text(showTranslation ? phrases[currentIndex].portuguese : phrases[currentIndex].english)
                        .font(.title)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .animation(.easeInOut, value: showTranslation)
                } else {
                    Text("Sem frases no deck.")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 30)

            // Botões de navegação
            HStack(spacing: 40) {
                Button(action: previous) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(currentIndex > 0 ? .blue : .gray)
                }
                .disabled(currentIndex == 0)

                Button(action: playEnglish) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.title)
                }

                Button(action: next) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(currentIndex < phrases.count - 1 ? .blue : .gray)
                }
                .disabled(currentIndex >= phrases.count - 1)
            }

            Spacer()
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
            }
        }

    }

    func previous() {
        if currentIndex > 0 {
            currentIndex -= 1
            showTranslation = false
        }
    }
    func next() {
        if currentIndex < phrases.count - 1 {
            currentIndex += 1
            showTranslation = false
        }
    }
    func playEnglish() {
        guard !phrases.isEmpty else { return }
        let utterance = AVSpeechUtterance(string: phrases[currentIndex].english)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

#Preview {
    let phrases = [
        Phrase(id: UUID(), english: "Good morning!", portuguese: "Bom dia!"),
        Phrase(id: UUID(), english: "How are you?", portuguese: "Como você está?"),
        Phrase(id: UUID(), english: "Thank you!", portuguese: "Obrigado!")
    ]
    FlashcardsSessionView(phrases: phrases)
}
