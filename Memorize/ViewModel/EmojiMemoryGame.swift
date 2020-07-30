//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
     // //////////////////
    //  PROPERTY WRAPPERS
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    
     // ///////////
    //  PROPERTIES
    
    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    } // var cards: Array<MemoryGame<String>.Card> {}
    
    
    
     // ////////
    //  METHODS
    
    private static func createMemoryGame()
        -> MemoryGame<String> {
        
        let emojis: Array<String> = ["👻" , "🎃" , "🕷"]
        
            return MemoryGame<String>(numberOfPairsOfCards : emojis.count ,
                                      cardContentFactory : {(pairIndex: Int) -> String in
                                        return emojis[pairIndex]
            })
    
    } // static func createMemoryGame() -> MemoryGame<String> {}
    
    
    
    // MARK: Intent/s
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card : card)
    } // func choose(card:) {}
    
    
    
    
    
} // class EmojiMemoryGame {}
