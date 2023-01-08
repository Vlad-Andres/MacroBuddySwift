//
//  HistoryView.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 08/01/2023.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Text("History View").foregroundColor(Color.white)
                    Spacer()
                    HStack {
                        Text("History").font(.largeTitle).foregroundColor(.white)
                        Spacer()
                        NavigationLink(destination: DashboardView()) {
                            Image("HomeBtn")
                        }
                        Spacer()
                        Text("Settings").font(.largeTitle).foregroundColor(.white)
                    }
                }
            }.background(Color.black)
        }.navigationBarBackButtonHidden()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
