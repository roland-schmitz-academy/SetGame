//
//  CardView.swift
//  SetGame
//
//  Created by Roland Schmitz on 24.07.20.
//

import SwiftUI

struct CardView : View {
    let card: SetGameViewModel.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size).position(x: geometry.size.width/2, y: geometry.size.height / 2)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: cardPadding(for: size)).fill(Color(.secondarySystemFill))
            card.content.padding(cardPadding(for: size))
        }
        .aspectRatio(cardAspectRatio, contentMode: .fit)
        .rotationEffect(.degrees(card.isSelected ? 10 : 0))
        .scaleEffect(card.isSelected ? 0.9 : 1)
//        .animation(card.isSelected ? Animation.easeInOut.repeatForever(autoreverses: true) : .default)
    }

    func cardPadding(for size: CGSize) -> CGFloat {
        min(size.width / 10, size.height * cardAspectRatio / 10 )
    }
    
    let cardAspectRatio: CGFloat = 2/3
}
    
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
