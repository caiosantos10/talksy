//
//  SignUpView.swift
//  talksy
//
//  Created by Caio Santos on 03/07/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    var switchToLogin: () -> Void

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                    .padding(.bottom, 8)
                Text("Create account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                TextField("Nome", text: $name)
                    .autocapitalization(.words)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
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
                Button("Cadastrar") {
                    if name.isEmpty || email.isEmpty || password.isEmpty {
                        errorMessage = "Preencha todos os campos"
                    } else {
                        errorMessage = nil
                        // Aqui, futuramente, você salva o usuário
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button("Já tenho conta. Entrar") {
                    switchToLogin()
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

