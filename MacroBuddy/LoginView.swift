//
//  LoginView.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 06/01/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            LoginTileView()
        }
        .background(Image("MainBkg"))
    }
}

struct LoginTileView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .padding(10)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x2E6B00))
            Text("Welcome Back !")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.white)
            Text("Sign in to your account")
                .padding(10)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x2E6B00))
            Divider().padding()
            TextField("E-mail", text: $email)
                .padding(20)
                .font(.system(size: 24))
                .foregroundColor(Color.white)
            TextField("Password", text: $password)
                .padding(20)
                .font(.system(size: 24))
                .foregroundColor(Color.white)
            Button(action: {
                print("Btn presset")
            }, label: {
                Text("Sign In")
                    .padding()
                    .padding([.trailing, .leading], 20)
                    .background(Color(hex: 0x2E6B00))
                    .foregroundColor(Color.white)
                    .cornerRadius(4)
            })
            .padding([.top, .bottom], 10)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
