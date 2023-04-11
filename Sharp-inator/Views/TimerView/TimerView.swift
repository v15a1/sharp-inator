//
//  ContentView.swift
//  Sharp-inator
//
//  Created by Visal Rajapakse on 2023-04-11.
//

import UserNotifications
import SwiftUI

struct TimerView: View {
    
    @State private var resumed = false
    @StateObject private var timerVM = TimerViewModel()
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(timerVM.remainingTime)
                .font(.system(size: 50, weight: .heavy, design: .rounded))
                .onReceive(timer) { _ in
                    timerVM.handleTimer()
                }
            HStack {
                RoundedButton(color: .blue, systemImage: resumed ? "pause.fill" : "play.fill") {
                    resumed.toggle()
                    if !resumed {
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    } else {
                        timer.upstream.connect().cancel()
                    }
                }
                .frame(width: 100)
                RoundedButton(color: .red, systemImage: "stop.fill") {
                    resumed = false
                    timer.upstream.connect().cancel()
                }
                .frame(width: 60)
            }
        }
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
