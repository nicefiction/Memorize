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
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
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
            
            cards.append(Card(id : pairIndex * 2 ,
                              content : content))
            
            cards.append(Card(id : pairIndex * 2 + 1 ,
                              content : content))
        } // for pairIndex in 0 ..< numberOfPairsOfCards {}
        
    } // init() {}
    
    
    
     // //////////////
    //  MARK: METHODS
    
    mutating func choose(card: Card) {
        print("Card chosen : \(card)")
        
        if
            let chosenIndex: Int = cards.firstIndex(matching : card) {
            self.cards[chosenIndex].isFaceUp.toggle()    
        } // if let chosenIndex {}
    } // func choose(card: Card) {}
    
    
    
    
    
} // struct MemoryGame {}
