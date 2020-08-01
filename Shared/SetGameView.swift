//
//  SetGameView.swift
//  SetGame
//
//  Created by Roland Schmitz on 24.07.20.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject private(set) var game: SetGameViewModel
    var body: some View {
        VStack {
            HStack {
                Text(game.playerCount == 1 ? "Solo" : "\(game.playerCount) Player").font(.headline)
                Spacer()
                Text(game.theme.name).font(.headline)
                Spacer()
                Text("Score: ....").font(.headline)
            }.padding(5)
            Divider()
            Grid(game.openCards) { card in
                CardView(card: card)
                    .padding(5)
                    //.aspectRatio(2 / 3, contentMode: .fit)
                    .onTapGesture {
                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                            game.choose(card: card)
                        }
                    }
                    .transition(AnyTransition.move(edge: Edge.allCases.randomElement()!))
            }
            Divider()
            HStack {
                Button {
                    withAnimation(Animation.easeInOut) {
                        game.openTopDeckCard()
                    }
                } label: {
                    Text("+1").blueButton()
                }

                Button {
                    withAnimation(Animation.easeInOut) {
                        3.times { game.openTopDeckCard() }
                    }
                } label: {
                    Text("+3").blueButton()
                }

                Button {
                    withAnimation(Animation.easeInOut) {
                        12.times { game.openTopDeckCard() }
                    }
                } label: {
                    Text("+12").blueButton()
                }


            }.padding(5)
            
            
            
//            Button {
//                withAnimation(Animation.easeInOut) {
//                    game.openTopDeckCard()
//                }
//            }, ) {
//                Text("New Card").padding(.vertical, 5).padding(.horizontal,20).background(Color(.systemBlue)).foregroundColor(Color(.systemBackground)).cornerRadius(10)
//            }.padding(5)
        }
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: SetGameViewModel())
    }
}
