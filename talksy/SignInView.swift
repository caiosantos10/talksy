//
//  SignInView.swift
//  talksy
//
//  Created by Caio Santos on 02/07/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("Talksy")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)

            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            Button("Entrar") {
                if email.isEmpty || password.isEmpty {
                    errorMessage = "Preencha todos os campos"
                } else {
                    errorMessage = nil
                    // Aqui entra a lógica de autenticação real
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}

