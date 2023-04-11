//
//  Int+Extensions.swift
//  Sharp-inator
//
//  Created by Visal Rajapakse on 2023-04-11.
//

import Foundation

extension Int {
    func minutesAndSeconds() -> String {
        let mins = String((self % 3600) / 60).padLeft(totalWidth: 2, with: "0")
        let secs = String((self % 3600) % 60).padLeft(totalWidth: 2, with: "0")
        return "\(mins):\(secs)"
    }
}
