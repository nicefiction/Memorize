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
        
        let chosenIndex: Int = self.index(of : card)
        self.cards[chosenIndex].isFaceUp.toggle()
    } // func choose(card: Card) {}
    
    
    func index(of card: Card)
        -> Int {
            
            for index in 0 ..< self.cards.count {
                if self.cards[index].id == card.id {
                    return index
                } // if cards[index].id == card.id {}
            } // for card in 0 ..< cards.count {}
        
            return 0 // FIXME: Bogus value
    } // func index(of card: Card) -> Int {}
    
} // struct MemoryGame {}
