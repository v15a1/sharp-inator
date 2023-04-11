//
//  RoundedButton.swift
//  Sharp-inator
//
//  Created by Visal Rajapakse on 2023-04-11.
//

import SwiftUI

struct RoundedButton: View {

    let color: Color
    let systemImage: String
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                color
                    .cornerRadius(10)
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
        .buttonStyle(.borderless)
        .frame(height: 60)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(color: Color.red, systemImage: "stop.fill", action: {})
    }
}
