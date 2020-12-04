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
        GeometryReader(content: {geometry in
        ZStack {
            if(card.isFaceUp){
                RoundedRectangle(cornerRadius: cornerRadisu).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadisu).stroke(lineWidth:edgeLineWidth)  //in points
                    Text(card.content)
            }
            else{
                RoundedRectangle(cornerRadius: cornerRadisu).fill()
        
            }
        }
        .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontScaleFactor))
    })
}
    // MARK: - Drawing Constants
    let cornerRadisu: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(GameVM: EmojiMemoryGame())
    }
}
