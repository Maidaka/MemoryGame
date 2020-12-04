//
//  MemoryGameLogic.swift
//  MemoryGame
//
//  Created by Maida on 11/30/20.
//

import Foundation

struct MemoryGameLogic<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        let chosenIndex: Int = cards.firstIndex(matching: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    func index(of card: Card) -> Int{
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return 0 // TODO: return
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()   //empty array
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, isFaceUp: true, isMatched: true, content: content))
            cards.append(Card(id: pairIndex*2+1, isFaceUp: true, isMatched: true, content: content))
        }
    }
}
