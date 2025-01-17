//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Maida on 11/30/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var GameModel: MemoryGameLogic<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameLogic<String> {
        let emojis: Array<String> = ["👻","🎃", "🕷"]
        return MemoryGameLogic<String>(numberOfPairsOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
        
    //MARK: - Access to the model
    
    var cards: Array<MemoryGameLogic<String>.Card>{
        GameModel.cards
    }
    //MARK: - Intent(s)
    
    func choose(card: MemoryGameLogic<String>.Card){
        GameModel.choose(card: card)
    }
    
    func resetGame(){
        GameModel = EmojiMemoryGame.createMemoryGame()
    }
}
