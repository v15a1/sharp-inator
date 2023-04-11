//
//  TimerViewModel.swift
//  Sharp-inator
//
//  Created by Visal Rajapakse on 2023-04-11.
//

import UserNotifications
import SwiftUI

enum TimerState {
    case resumed
    case rest
}

class TimerViewModel: ObservableObject {
    private let minutes: Double = TimerConsts.focusMinutes
    private let restSeconds: Double = TimerConsts.restSeconds
    private let seconds: Double
    
    private var remainingSeconds: Int
    private var state = TimerState.resumed
    
    @Published var remainingTime = ""
    
    init() {
        seconds = minutes * 60
        remainingSeconds = Int(seconds)
        remainingTime = remainingSeconds.minutesAndSeconds()
    }
    
    func handleTimer() {
        if remainingSeconds >= 0 {
            remainingSeconds -= 1
            if remainingSeconds < 0 {
                let stateFlag = state == .resumed
                state = stateFlag ? .rest : .resumed
                remainingSeconds = Int(stateFlag ? restSeconds : seconds)
                notify()
            }
        }
        remainingTime = remainingSeconds.minutesAndSeconds()
    }
    
    func reset() {
        remainingSeconds = Int(seconds)
        remainingTime = remainingSeconds.minutesAndSeconds()
    }
    
    private func notify() {
        let soundAsset = state == .rest ? "restOver.aiff" : "restStart.aiff"

        let content = UNMutableNotificationContent()
        content.title = state == .rest ? "REST" : "CONTINUING"
        content.subtitle = state == .rest ? "20 Secs rest" : "20 mins work!"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(soundAsset))
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
