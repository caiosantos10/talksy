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
    @State private var showSignUp = false
    
    var switchToSignUp: () -> Void
    var onLogin: () -> Void

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Image(systemName: "text.bubble")
                    .resizable().scaledToFit()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.blue)
                    .padding(.bottom, 8)
                Text("Talksy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 16)

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
                        onLogin()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button("Cadastre-se") {
                    switchToSignUp()
                }
                .foregroundColor(.blue)
                .padding(.top, 10)
                
            }
        }
    }
}

#Preview {
    ContentView()
}

