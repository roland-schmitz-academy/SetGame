//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Roland Schmitz on 23.07.20.
//

import Foundation
import SwiftUI


class SetGameViewModel : ObservableObject {
    typealias Game = SetGame<CardContentView>
    typealias Card = Game.Card

    @Published private(set) var theme: Theme
    @Published private(set) var playerCount: Int = 1
    @Published private var game: Game

    init() {
        let theme = themes.first!
        self.theme = theme
        self.game =
            SetGame<CardContentView>(
                countRange: theme.counts,
                colorIndices: theme.colors.indices,
                shapeIndices: theme.shapes.indices,
                shadingIndices: theme.shadings.indices,
                contentFactory: { count, colorIndex, shapeIndex, shadingIndex in
                    CardContentView(
                        count: count,
                        color: theme.colors[colorIndex],
                        shape: theme.shapes[shapeIndex],
                        shading: theme.shadings[shadingIndex]
                    )
                }
            )
        
    }

    var cards: [Card] {
        game.cards
    }
    
    var openCards: [Card] {
        cards.filter { card in card.position == .onTable}
    }
    
    func openTopDeckCard() {
        if let topDeckCardIndex = game.cards.firstIndex(where: { $0.position == .inDeck}) {
            game.cards[topDeckCardIndex].position = .onTable
        }
    }
    
    func choose(card: Card) {
        print("card \(card) chosen")
        if let cardIndex = game.cards.firstIndex(where: { $0.id == card.id}) {
            game.cards[cardIndex].position = .inDeck
        }
    }
}
