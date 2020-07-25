//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    
     // ///////////
    //  PROPERTIES
    
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards : 2 ,
                                                               cardContentFactory : { (pairIndex: Int) -> String in
                                                                  return "🤩"
                                                               })
    
    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    } // var cards: Array<MemoryGame<String>.Card> {}
    
    
    
     // ////////
    //  METHODS
    
    // MARK: Intent/s
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card : card)
    } // func choose(card:) {}
    
    
    
    
    
} // class EmojiMemoryGame {}
