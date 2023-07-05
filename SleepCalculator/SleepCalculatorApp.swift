//
//  SleepCalculatorApp.swift
//  SleepCalculator
//
//  Created by Amartya Bhattacharya on 6/28/23.
//

import SwiftUI

@main
struct SleepCalculatorApp: App {
    init() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor.clear
            tabBarAppearance.backgroundImage = UIImage()
            tabBarAppearance.shadowImage = UIImage()
            tabBarAppearance.shadowColor = .clear
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
