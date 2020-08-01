//
//  BlueButton.swift
//  SetGame
//
//  Created by Roland Schmitz on 26.07.20.
//

import SwiftUI

struct BlueButton : ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            .background(Color(.systemBlue))
            .foregroundColor(Color(.systemBackground))
            .cornerRadius(10)
            .padding(5)
    }
}


extension View {
    func blueButton() -> some View {
        modifier(BlueButton())
    }
}
