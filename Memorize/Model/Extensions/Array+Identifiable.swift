//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Olivier Van hamme on 28/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element)
        -> Int {
            
            for index in 0 ..< self.count {
                if self[index].id == matching.id {
                    return index
                } // if self[index].id == matching.id {}
            } // for index in 0 ..< self.count {}
            
            return 0 // FIXME: Bogus
    } // func index(of item: Item) -> Int {}
    
    
    
} // extension Array where Element: Identifiable {}
