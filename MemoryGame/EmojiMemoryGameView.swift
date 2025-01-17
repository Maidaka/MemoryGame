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
        VStack{
            Grid(GameVM.cards) { card in
                    CardView(card: card).onTapGesture{
                        withAnimation(.linear(duration: 0.5)){
                        GameVM.choose(card: card)
                        }
                    }
                    .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut(duration: 0.75)) {
                    self.GameVM.resetGame()
                }
            }, label: { Text("New Game")}) //strings can be internationalizible - localized string key
        }
    }
}

struct CardView: View {
    var card: MemoryGameLogic<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining : Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration : card.bonusTimeRemaining)){
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime{
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                .padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
            
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
