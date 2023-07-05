//
//  SleepCycleCalculator.swift
//  SleepCalculator
//
//  Created by Amartya Bhattacharya on 6/28/23.
//

import Foundation

struct SleepCycleCalculator {
    static let cycleDuration: Double = 90 // cycle duration in minutes
    
    static func calculateWakeUpTimes() -> [Date] {
        let now = Date()
        return (1...6).map { addMinutesTo(date: now, minutes: $0 * Int(cycleDuration) + 14) }
    }
    
    static func calculateFallAsleepTimes(wakeUpAt: Date) -> [Date] {
        return (3...6).reversed().map { subtractMinutesFrom(date: wakeUpAt, minutes: $0 * Int(cycleDuration)) }
    }
    
    static func calculateWakeUpTimes(fallAsleepAt: Date) -> [Date] {
        return (3...6).map { addMinutesTo(date: fallAsleepAt, minutes: $0 * Int(cycleDuration)) }
    }
    
    static private func addMinutesTo(date: Date, minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: date) ?? date
    }
    
    static private func subtractMinutesFrom(date: Date, minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: -minutes, to: date) ?? date
    }
}
