//
//  MemoryGame.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> {
    
     // //////////////////
    //  MARK: NAMESPACING
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    } // struct Card {}
    
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var cards: Array<Card>
    
    
    
     // //////////////////////////
    //  MARK: INITIALIZER METHODS
    
    init(numberOfPairsOfCards: Int ,
         cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(isFaceUp : false ,
                              isMatched : false ,
                              content : content))
            
            cards.append(Card(isFaceUp : false ,
                              isMatched : false ,
                              content : content))
        } // for pairIndex in 0 ..< numberOfPairsOfCards {}
        
    } // init() {}
    
    
    
     // //////////////
    //  MARK: METHODS
    
    func choose(card: Card) {
        print("Card chosen : \(card)")
    } // func choose(card: Card) {}
    
} // struct MemoryGame {}
