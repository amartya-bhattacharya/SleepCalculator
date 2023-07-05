//
//  FallAsleepView.swift
//  SleepCalculator
//
//  Created by Amartya Bhattacharya on 6/28/23.
//

import SwiftUI

struct FallAsleepView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedDate = Date()
    @State private var times = [Date]()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        ZStack {
            // Background gradient
            RadialGradient(gradient: Gradient(colors: [colorScheme == .dark ? Color.black : Color.white, colorScheme == .dark ? Color(UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)) : Color(UIColor(red: 0, green: 0.25, blue: 1, alpha: 1))]),
                           center: .top,
                           startRadius: 400,
                           endRadius: 700)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I plan to fall asleep at...")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                DatePicker("", selection: $selectedDate, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                
                Button(action: {
                    times = SleepCycleCalculator.calculateWakeUpTimes(fallAsleepAt: selectedDate)
                }) {
                    Text("Calculate")
                        .font(.headline)
                        .padding()
                        .background(Color.secondary.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                
                if !times.isEmpty {
                    Spacer()
                    Text("You should try to wake up at one of the following times:")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.bottom, 20)
                    
                    ScrollView {
                        ForEach(0..<times.count, id: \.self) { index in
                            HStack {
                                Text("\(index+1). ")
                                + Text("\(formatter.string(from: times[index]))").bold()
                                + Text(" For \(index+3) cycles - \(String(format: "%.1f", (Double(index+3)*SleepCycleCalculator.cycleDuration)/60)) hours of sleep")
                            }
                            .padding()
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                            .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                }
            }
            .padding()
        }
//        .background(Color.systemBackground)
    }
}

struct FallAsleepView_Previews: PreviewProvider {
    static var previews: some View {
        FallAsleepView()
    }
}
