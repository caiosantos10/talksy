//
//  FlashcardView.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import SwiftUI
import AVFoundation

struct FlashcardView: View {
    let phrase: Phrase
    @State private var showTranslation = false

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            // Frente: Inglês, Verso: Português
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

                Text(showTranslation ? phrase.portuguese : phrase.english)
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding(.horizontal, 30)
            .animation(.easeInOut, value: showTranslation)

            // Botão de áudio
            Button(action: playEnglish) {
                HStack {
                    Image(systemName: "speaker.wave.2.fill")
                    Text("Ouvir pronúncia")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }

            Spacer()
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }

    // Função para falar a frase em inglês
    func playEnglish() {
        let utterance = AVSpeechUtterance(string: phrase.english)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

#Preview {
    let samplePhrase = Phrase(id: UUID(), english: "Good morning!", portuguese: "Bom dia!")
    FlashcardView(phrase: samplePhrase)
}
