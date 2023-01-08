//
//  RegisterView.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 06/01/2023.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            RegisterTileView()
        }
        .background(Image("MainBkg"))
    }
}

struct RegisterTileView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("SIGN UP")
                .padding(.top, 20)
                .padding(10)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x2E6B00))
            Text("Create an Account")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.white)
            Text("Welcome")
                .padding(10)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x2E6B00))
            Divider().frame(height: 0.8).overlay(.black).padding([.leading, .trailing], 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("First Name")
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
                    Text("Second Name")
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
            }.padding(0)

            
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

            Button(action: {
                print("Btn presset")
            }, label: {
                Text("CREATE ACCOUNT")
                    .foregroundColor(Color.white)
                    .cornerRadius(4)
            })
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color(hex: 0x2E6B00))
            .padding(20)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
