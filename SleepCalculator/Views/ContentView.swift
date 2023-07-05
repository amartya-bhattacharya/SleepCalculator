//
//  ContentView.swift
//  SleepCalculator
//
//  Created by Amartya Bhattacharya on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().isTranslucent = true
    }
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                FallAsleepView()
            }
            .tabItem {
                Image(systemName: "moon.zzz.fill")
                Text("Plan to Sleep")
            }
            .tag(0)
            
            NavigationView {
                SleepNowView()
            }
            .tabItem {
                Image(systemName: "bed.double.fill")
                Text("Sleep Now")
            }
            .tag(1)
            
            NavigationView {
                WakeUpView()
            }
            .tabItem {
                Image(systemName: "alarm.fill")
                Text("Wake Up At")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
