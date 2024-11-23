//
//  LoginView.swift
//  FirebaseAuthYouTube
//
//  Created by Bipul Islam on 23/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 16){
                    //logo
                    logo
                    
                    //title
                    title
                    
                    Spacer().frame(height: 12)
                    
                    //textfields
                    InputView(placeholder: "Email or Phone Number", text: $email)
                    InputView(placeholder: "Password", isSecureField: true, text: $password)
                    
                    //forgot button
                    forgotButton
                    
                    //login button
                    loginButton
                    
                    Spacer()
                    
                    //bottom view
                    bottomView
                    
                    
                }
            }.ignoresSafeArea()
                .padding(.horizontal)
                .padding(.vertical, 8)
        }
    }
    
    private var line: some View{
        VStack{
            Divider().frame(height: 1)
        }
    }
    
    private var logo: some View{
        Image("login_image")
            .resizable()
            .scaledToFit()
    }
    private var title: some View{
        Text("Let's connect with US!")
            .font(.title2)
            .fontWeight(.semibold)
        
    }
    private var forgotButton: some View{
        HStack{
            Spacer()
            
            Button{
                
            }label: {
                Text("Forgot Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
        
    }
    private var loginButton: some View{
        Button{
            
        } label: {
            Text("Login")
            
        }.buttonStyle(CapsuleButtonStyle())
        
    }
    private var bottomView: some View {
        VStack(spacing: 16){
            bottomOrView
            appleButton
            googleButton
            signUpButton
        }
        
    }
    private var bottomOrView: some View{
        HStack (spacing: 16){
            line
            Text("Or")
            line
        }.foregroundStyle(.gray)
        
    }
    private var appleButton: some View{
        Button{
            
        } label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        }
        .buttonStyle(CapsuleButtonStyle(bgColor: .black))
        
    }
    private var googleButton: some View{
        Button{
            
        } label: {
            HStack{
                Image("google")
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("Sign up with Google")
            }
        }.buttonStyle(CapsuleButtonStyle(bgColor: .clear, textColor: .black, hasBorder: true))
    }
    private var signUpButton: some View{
        NavigationLink {
            
        } label: {
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(.black)
                
                Text("Sign Up")
                    .foregroundStyle(.teal)
            }
            .fontWeight(.medium)
        }
    }
    
}

#Preview {
    LoginView()
}
