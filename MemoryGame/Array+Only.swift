//
//  Array+Only.swift
//  MemoryGame
//
//  Created by Maida on 12/4/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
