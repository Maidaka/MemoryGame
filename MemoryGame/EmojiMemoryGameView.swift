//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Maida on 11/26/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var GameVM: EmojiMemoryGame
    
    var body: some View {
        Grid(GameVM.cards) { card in
                CardView(card: card).onTapGesture{
                    GameVM.choose(card: card)
                    
                }
                .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
        
    }
}

struct CardView: View {
    var card: MemoryGameLogic<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: size)))
            }
        .cardify(isFaceUp: card.isFaceUp)
        }
    }

    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(GameVM: EmojiMemoryGame())
    }
}
