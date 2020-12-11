//
//  Cardify.swift
//  MemoryGame
//
//  Created by Maida on 12/7/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    init(isFaceUp : Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp : Bool{
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation}
        set {rotation = newValue}
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadisu).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadisu).stroke(lineWidth:edgeLineWidth)  //in points
                content
            }
                    .opacity(isFaceUp ? 1 : 0)
                RoundedRectangle(cornerRadius: cornerRadisu).fill()
                    .opacity(isFaceUp ? 0 : 1)
    }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
}
    private let cornerRadisu: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
}
    extension View {
        func cardify(isFaceUp: Bool) -> some View {
            self.modifier(Cardify(isFaceUp: isFaceUp))
        }
    }


