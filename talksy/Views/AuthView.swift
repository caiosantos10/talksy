//
//  AuthView.swift
//  talksy
//
//  Created by Caio Santos on 03/07/25.
//

import SwiftUI

struct AuthView: View {
    @State private var isSignUp: Bool = true  // ou false para iniciar pelo login
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            if isLoggedIn {
                DecksView()
            } else if isSignUp {
                SignUpView(switchToLogin: { isSignUp = false })
            } else {
                SignInView(switchToSignUp: { isSignUp = true }, onLogin: {
                    isLoggedIn = true // <-- seta logado ao clicar em entrar
                })
            }
        }
    }
}

#Preview {
    AuthView()
}
