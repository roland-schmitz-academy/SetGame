//
//  SetGame.swift
//  SetGame
//
//  Created by Roland Schmitz on 23.07.20.
//

import Foundation

struct SetGame<CardContent> {
    var cards: [Card] = []

    init(countRange: ClosedRange<Int>, colorIndices: Range<Int>, shapeIndices: Range<Int>, shadingIndices: Range<Int>, contentFactory: (_ symbolCount: Int, _ symbolColorIndex: Int, _ symbolShapeIndex: Int, _ symbolShadingIndex: Int) -> CardContent) {
        var cardId: Int = 0
        for count in countRange {
            for colorIndex in colorIndices {
                for shapeIndex in shapeIndices {
                    for shadingIndex in shadingIndices {
                        cards.append(Card(id: cardId , symbolCount: count, symbolColorIndex: colorIndex, symbolShapeIndex: shapeIndex, symbolShadingIndex: shadingIndex, content: contentFactory(count, colorIndex, shapeIndex, shadingIndex), position: .inDeck))
                        cardId += 1
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    enum CardPosition {
        case inDeck, onTable, removed
    }

    struct Card : Identifiable {
        let id: Int
        let symbolCount: Int
        let symbolColorIndex: Int
        let symbolShapeIndex: Int
        let symbolShadingIndex: Int
        let content: CardContent
        var position: CardPosition
        var isSelected: Bool = false
        var isMatched: Bool = false
        
    }
}


