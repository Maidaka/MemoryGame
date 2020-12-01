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
        return HStack {
            ForEach(GameVM.cards) { card in
                CardView(card: card).onTapGesture{
                    GameVM.choose(card: card)
                    
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGameLogic<String>.Card
    var body: some View{
        ZStack {
            if(card.isFaceUp){
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth:3)  //in points
                    Text(card.content)
                
            }
            else{
                RoundedRectangle(cornerRadius: 10.0).fill()
        
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(GameVM: EmojiMemoryGame())
    }
}
