//
//  ProgressGraphView.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 08/01/2023.
//

import SwiftUI

struct ProgressGraphView: View {
    let type: GraphType
    let color: Color
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var daysLabels: [String] = getOneWeekBackDaysLabels()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("100").foregroundColor(Color.white)
                    Spacer()
                    Text("50").foregroundColor(Color.white)
                    Spacer()
                    Text("0").foregroundColor(Color.white)
                }
                ZStack {
                    VStack {
                        Divider().frame(height: 0.3).overlay(.white).padding(.top, 10)
                        Spacer()
                        Divider().frame(height: 0.3).overlay(.white)
                        Spacer()
                        Divider().frame(height: 0.3).overlay(.white).padding(.bottom, 10)
                    }
                    ProgressLine(type: type)
                        .stroke(lineWidth: 3)
                        .fill(color)
    //                    .fill(Color.red
    //                        .linearGradient(
    //                            Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
    //                            startPoint: UnitPoint(x: 0.5, y: 0),
    //                            endPoint: UnitPoint(x: 0.5, y: 0.6)
    //                        )
    //                    )
                }
            }
            HStack {
                ForEach(daysLabels, id: \.hashValue) { day in
                    Text(day).foregroundColor(Color.white)
                    Spacer()
                }
            }.padding(.leading, 30)
        }
        .background(Color.black)
    }
}

struct ProgressLine: Shape {
    let type: GraphType

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let data = getSanitizedDataArr(data: StatRecord.sampleData, type: type)
        let widthStep = 1/Double(data.count-1)
        let maxVal = 100.0
        if data.count > 0 {
            path.move(to: CGPoint(x: rect.minX, y: (1 - (data[0]/maxVal)) * rect.maxY))
            var i = 1
            while (i+1 < data.count) {
                path.addQuadCurve(
                    to: CGPoint(
                        x: CGFloat(Double(i+1) * widthStep) * rect.maxX,
                        y: (1 - (data[i+1]/maxVal)) * rect.maxY
                    ),
                    control: CGPoint(
                        x: CGFloat(Double(i) * widthStep) * rect.maxX,
                        y: (1 - (data[i]/maxVal)) * rect.maxY
                    )
                )
                
                path.move(to: CGPoint(
                    x: CGFloat(Double(i+1) * widthStep) * rect.maxX,
                    y: (1 - (data[i+1]/maxVal)) * rect.maxY
                ))
                i = i + 2
            }
            
            if (i != data.count) {
                path.addLine(to:  CGPoint(
                    x: CGFloat(Double(i) * widthStep) * rect.maxX,
                    y: (1 - (data[i]/maxVal)) * rect.maxY
                ))
            }
        }
        
        return path
    }
}

enum GraphType {
    case Carbs
    case Fats
    case Protein
}

func getOneWeekBackDaysLabels() -> [String]{
    let calendar = Calendar.current
    let components = DateComponents(hour: 0, minute: 0, second: 0) // midnight
    var result: [String] = []
    
    let today = Date()
    let startDate = calendar.date(byAdding: .day, value: -7, to: today)!

    calendar.enumerateDates(startingAfter: startDate, matching: components, matchingPolicy: .nextTime) { (date, strict, stop) in
        if let date = date {
            if date <= today {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd.MM"
                result.append(dateFormatter.string(from: date))
            } else {
                stop = true
            }
        }
    }
    return result
}

func getSanitizedDataArr(data: [StatRecord], type: GraphType) -> [Double] {
    
    let calendar = Calendar.current
    let today = Date()
    let startDate = calendar.date(byAdding: .day, value: -7, to: today)!
    let records = StatRecord.sampleData
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yy HH:mm"

    var structuredArray: [Double] = []

    // Finding matching dates at midnight - adjust as needed
    let components = DateComponents(hour: 0, minute: 0, second: 0) // midnight
    calendar.enumerateDates(startingAfter: startDate, matching: components, matchingPolicy: .nextTime) { (date, strict, stop) in
        if let date = date {
            if date <= today {
                var sumOfDay: Double = 0.0
                for r in records {
                    let d = dateFormatter.date(from: r.date) ?? Date()
                    let isSameDay = calendar.isDate(d, equalTo: date, toGranularity: .day)
                    if isSameDay {
                        if type == .Carbs {
                            structuredArray.append(r.carbs)
                            sumOfDay = sumOfDay + r.carbs
                        } else if type == .Fats {
                            structuredArray.append(r.fats)
                            sumOfDay = sumOfDay + r.fats
                        } else {
                            structuredArray.append(r.protein)
                            sumOfDay = sumOfDay + r.protein
                        }
                    }
                }
//                structuredArray.append(sumOfDay)

            } else {
                stop = true
            }
        }
    }
    
    return structuredArray
}

struct ProgressGraphView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressGraphView(type: .Protein, color: Color.red)
    }
}
