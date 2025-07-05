//
//  AuthView.swift
//  talksy
//
//  Created by Caio Santos on 03/07/25.
//

import SwiftUI

struct AuthView: View {
    @State private var isSignUp: Bool = true  // ou false para iniciar pelo login

    var body: some View {
        NavigationStack {
            if isSignUp {
                SignUpView(switchToLogin: { isSignUp = false })
            } else {
                SignInView(switchToSignUp: { isSignUp = true })
            }
        }
    }
}

#Preview {
    AuthView()
}
