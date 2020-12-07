//
//  MemoryGameLogic.swift
//  MemoryGame
//
//  Created by Maida on 11/30/20.
//

import Foundation

struct MemoryGameLogic<CardContent> where CardContent: Equatable{
   private(set) var cards: Array<Card>
    
    private var IndexOfOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter {index -> Bool in cards[index].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards [index].isFaceUp = index == newValue
            }
        }
    }
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = IndexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
            } else {
                IndexOfOnlyFaceUpCard = chosenIndex //becomes the only face up again
            }
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()   //empty array
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
}
