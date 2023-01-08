//
//  LoginView.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 06/01/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
//        NavigationStack {
//            VStack {
                LoginTileView()
//            }
//            .background(Image("MainBkg"))
//        }

    }
}

struct LoginTileView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
           VStack {
                Text("Sign In")
                    .padding(.top, 20)
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
                Divider().frame(height: 0.8).overlay(.black).padding([.leading, .trailing], 10)
                VStack(alignment: .leading) {
                    Text("E-mail")
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                    TextField("", text: $email)
                        .font(.system(size: 32))
                        .foregroundColor(Color.white)
                        .background(Color(hex: 0x20202059))
                        .opacity(0.3)
                }
                .frame(width: .infinity)
                .padding(20)

                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                    TextField("", text: $email)
                        .font(.system(size: 32))
                        .foregroundColor(Color.white)
                        .background(Color(hex: 0x20202059))
                        .opacity(0.3)
                }
                .frame(width: .infinity)
                .padding(20)
                NavigationLink(destination: DashboardView() ) {
                    Button(action: {
                        print("Btn presset")
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .cornerRadius(4)
                    })
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color(hex: 0x2E6B00))
                    .padding(20)
                }

            }
           .background(.ultraThinMaterial)
           .cornerRadius(10)
           .padding()
           .background(Image("MainBkg"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
