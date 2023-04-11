//
//  SharpinatorApp.swift
//  Sharp-inator
//
//  Created by Visal Rajapakse on 2023-04-11.
//

import SwiftUI

@main
struct SharpinatorApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            TimerView()
        }
    }
}
