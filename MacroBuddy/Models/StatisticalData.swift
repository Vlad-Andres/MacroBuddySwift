//
//  StatisticalData.swift
//  MacroBuddy
//
//  Created by Vlad Andres on 08/01/2023.
//

import Foundation

struct StatRecord {
    let date: String
    let carbs: Double
    let fats: Double
    let protein: Double
}

extension StatRecord {
    static let sampleData: [StatRecord] =
    [
        StatRecord(date: "01/01/2023 06:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "01/01/2023 13:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "01/01/2023 18:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "02/01/2023 06:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "02/01/2023 13:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "02/01/2023 18:00", carbs: 10.0, fats: 20.0, protein: 70.0),
        StatRecord(date: "03/01/2023 06:00", carbs: 00.0, fats: 40.0, protein: 60.0),
        StatRecord(date: "03/01/2023 13:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "03/01/2023 18:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "04/01/2023 06:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "04/01/2023 13:00", carbs: 10.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "04/01/2023 18:00", carbs: 50.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "05/01/2023 06:00", carbs: 40.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "06/01/2023 13:00", carbs: 50.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "06/01/2023 18:00", carbs: 30.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "06/01/2023 06:00", carbs: 10.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "07/01/2023 13:00", carbs: 10.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "07/01/2023 18:00", carbs: 10.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "08/01/2023 13:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "08/01/2023 18:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "08/01/2023 06:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "09/01/2023 13:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "09/01/2023 18:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "09/01/2023 06:00", carbs: 20.0, fats: 30.0, protein: 50.0),
        StatRecord(date: "10/01/2023 13:00", carbs: 20.0, fats: 30.0, protein: 50.0)
    ]
}
