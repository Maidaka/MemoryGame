//
//  Array+Identifiable.swift
//  MemoryGame
//
//  Created by Maida on 12/4/20.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int? { //making an optional Int?
        for index in 0..<self.count {
            if self[index].id == matching.id {
            return index
            }
        }
        return nil  //Optional allows to return nil 
    }
}

