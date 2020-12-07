//
//  Cardify.swift
//  MemoryGame
//
//  Created by Maida on 12/7/20.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp : Bool
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadisu).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadisu).stroke(lineWidth:edgeLineWidth)  //in points
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadisu).fill()
        }
    }
}
    private let cornerRadisu: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
}
    extension View {
        func cardify(isFaceUp: Bool) -> some View {
            self.modifier(Cardify(isFaceUp: isFaceUp))
        }
    }


