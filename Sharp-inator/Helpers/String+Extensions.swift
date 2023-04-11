//
//  String+Extensions.swift
//  Sharp-inator
//
//  Created by Visal Rajapakse on 2023-04-11.
//

import Foundation

///https://stackoverflow.com/questions/25566581/leading-zeros-for-int-in-swift
extension String {
    func padLeft(totalWidth: Int, with byString: String) -> String {
        let toPad = totalWidth - self.count
        if toPad < 1 {
            return self
        }
    
        return "".padding(toLength: toPad, withPad: byString, startingAt: 0) + self
    }
}
