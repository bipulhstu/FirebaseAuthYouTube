//
//  CreateAccountView.swift
//  FirebaseAuthYouTube
//
//  Created by Bipul Islam on 23/11/24.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        VStack(spacing: 16){
            Text("Please complete all information to create an account.")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
           
            
            InputView(placeholder: "Email or Phone Number", text: $email)
            InputView(placeholder: "Full Name", text: $fullName)
            InputView(placeholder: "Password", isSecureField: true ,text: $password)
            
            ZStack (alignment: .trailing){
                InputView(placeholder: "Confirm Password", isSecureField: true, text: $confirmPassword)
                    
                Spacer()
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    Image(systemName: isValidPassword ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword ?
                                         Color(.systemGreen) :
                                            Color(.systemRed))
                    
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Create Account")
                    
            }.buttonStyle(CapsuleButtonStyle())

        }
        .navigationTitle("Set up your account")
        .toolbarRole(.editor)
        .padding()
    }
    
    var isValidPassword: Bool {
        password == confirmPassword
    }
}

#Preview {
    CreateAccountView()
}
