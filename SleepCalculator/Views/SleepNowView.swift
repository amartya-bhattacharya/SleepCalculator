//
//  SleepNowView.swift
//  SleepCalculator
//
//  Created by Amartya Bhattacharya on 6/28/23.
//

import SwiftUI

struct SleepNowView: View {
    @State private var times = [Date]()
        let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return formatter
        }()
    
    var body: some View {
            VStack {
                Button(action: {
                    times = SleepCycleCalculator.calculateWakeUpTimes()
                }) {
                    Text("Sleep Now")
                        .font(.title)
                        .padding()
                        .background(Color.accentColor.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                }
                if !times.isEmpty {
                    Text("If you head to bed right now, you should try to wake up at one of the following times:")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.bottom, 20)
                    
                    ForEach(0..<times.count, id: \.self) { index in
                        HStack {
                            Text("\(index+1). ")
                            + Text("\(formatter.string(from: times[index]))").bold()
                            + Text(" For \(index + 1) cycles - \(String(format: "%.1f", (Double(index + 1)*SleepCycleCalculator.cycleDuration)/60)) hours of sleep")
                        }
                        .padding()
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(10)
                        .fixedSize(horizontal: true, vertical: false)
//                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding()
//            .background(Color.systemBackground)
        }
}

struct SleepNowView_Previews: PreviewProvider {
    static var previews: some View {
        SleepNowView()
    }
}
