//
//  DashboardView.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 08/01/2023.
//

import SwiftUI

struct DashboardView: View {
    let proteinVal: Double = 50.2
    let carbVal: Double = 20.8
    let fatsVal: Double = 29.0
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Text("Last Meal's Macros")
                        .frame(width: geometry.size.width, height: geometry.size.width * 0.1)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    
                    // Diagram
                    VStack {
                        Diagram(valueP: proteinVal, valueC: carbVal, valueF: fatsVal)
                            .padding()
                        HStack {
                            LegendItem(text: "Protein", color: Color(hex: 0x2E6B00), value: proteinVal)
                            LegendItem(text: "Carbohydrats", color: Color(hex: 0xAE9927), value: carbVal)
                            LegendItem(text: "Fats", color: Color(hex: 0x9D2B2B), value: fatsVal)
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                    ProgressGraphView(type: .Carbs, color: Color(hex: 0xAE9927))
                        .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    ProgressGraphView(type: .Protein, color: Color(hex: 0x2E6B00))
                        .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    ProgressGraphView(type: .Fats, color: Color(hex: 0x9D2B2B))
                        .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    
                    HStack {
                        NavigationLink (destination: HistoryView()) {
                            Text("History").font(.largeTitle).foregroundColor(.white)
                        }
                        Spacer()
                        Image("HomeBtn")
                        Spacer()
                        Text("Settings").font(.largeTitle).foregroundColor(.white)
                    }
                }
            }.background(Color.black)
        }.navigationBarBackButtonHidden()

    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct LegendItem: View {
    let text: String
    let color: Color
    let value: Double
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(color)
            VStack {
                Text(text).font(.caption).foregroundColor(Color(hex: 0xA1A1A1))
                Text("\(String(value)) %").font(.caption).foregroundColor(Color.white)
            }
        }.padding()
    }
}

struct Diagram: View {
    let valueP: Double
    let valueC: Double
    let valueF: Double
    
    func getDeg(val: Double) -> Double {
        return Double((val/100) * 360)
    }
    
    var body: some View {
        let degA = getDeg(val: valueP)
        let degB = degA + getDeg(val: valueC)
        let degC = degB + getDeg(val: valueF)
        return ZStack {
            Arc(startAngle: .degrees(0), endAngle: .degrees(degA), clockwise: false)
              .stroke(Color(hex: 0x2E6B00), lineWidth: 24)
              .frame(width: 100, height: 100)
            Arc(startAngle: .degrees(degA), endAngle: .degrees(degB), clockwise: false)
              .stroke(Color(hex: 0xAE9927), lineWidth: 24)
              .frame(width: 100, height: 100)
            Arc(startAngle: .degrees(degB), endAngle: .degrees(degC), clockwise: false)
              .stroke(Color(hex: 0x9D2B2B), lineWidth: 24)
              .frame(width: 100, height: 100)
        }
    }

}

struct Arc: Shape {
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool

  func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = max(rect.size.width, rect.size.height) / 2
    path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise)
    return path
  }
}
