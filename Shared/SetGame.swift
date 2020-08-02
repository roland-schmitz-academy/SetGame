//
//  SetGame.swift
//  SetGame
//
//  Created by Roland Schmitz on 23.07.20.
//

import Foundation

struct SetGame<CardContent> {
    private(set) var cards: [Card] = []

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
    }
    
    var openCards: [Card] {
        cards.filter { card in card.position == .onTable}
    }
    
    var selectedCards: [Card] {
        cards.filter { card in card.isSelected }
    }
    
    mutating func showTopDeckCard() {
        if let topDeckCardIndex = cards.firstIndex(where: { $0.position == .inDeck}) {
            cards[topDeckCardIndex].position = .onTable
        }
    }
    
    mutating func choose(card: Card) {
        if selectedCards.count == 3 {
            cards.indices
                .filter { cards[$0].isSelected }
                .forEach { cardIndex in
                    cards[cardIndex].isSelected = false
                    if cards[cardIndex].setState == .matching {
                        cards[cardIndex].position = .removed
                    } else {
                        cards[cardIndex].setState = .incomplete
                    }
                }
            while openCards.count < 12 {
                showTopDeckCard()
            }
        }
        if card.setState == .incomplete && card.position == .onTable {
            if let cardIndex = cards.firstIndex(where: { $0.id == card.id}) {
                cards[cardIndex].isSelected.toggle()
            }
        }
        let setState = calculateSetState(for: selectedCards)
        if setState != .incomplete {
            cards.indices
                .filter { cards[$0].isSelected }
                .forEach { cardIndex in
                    cards[cardIndex].setState = setState
                }
        }
    }

    func calculateSetState(for possibleSet: [Card]) -> SetState {
        if possibleSet.count != 3 {
            return .incomplete
        } else {
            return (
                Set(possibleSet.map { $0.symbolCount }).count != 2 &&
                    Set(possibleSet.map { $0.symbolColorIndex }).count != 2 &&
                    Set(possibleSet.map { $0.symbolShapeIndex }).count != 2 &&
                    Set(possibleSet.map { $0.symbolShadingIndex }).count != 2
            ) ? .matching : .nonMatching
        }
    }
    
    mutating func reset() {
        cards.indices.forEach { cardIndex in
            cards[cardIndex].reset()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func deal() {
        reset()
        shuffle()
        12.times { showTopDeckCard() }
    }
    
    mutating func showMore() {
        3.times { showTopDeckCard() }
    }
    
    enum CardPosition {
        case inDeck, onTable, removed
    }
    
    enum SetState {
        case incomplete, matching, nonMatching
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
        var setState: SetState = .incomplete
        
        mutating func reset() {
            position = .inDeck
            isSelected = false
            setState = .incomplete
        }
    }

}


