//
//  MemoryGame.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    
     // //////////////////
    //  MARK: NAMESPACING
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    } // struct Card {}
    
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Optional<Int> = nil
    
    
    
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
            let chosenIndex: Int = cards.firstIndex(matching : card) ,
            !cards[chosenIndex].isFaceUp ,
            !cards[chosenIndex].isMatched {
            
            if
                let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                } // if cards[chosenIndex].content == cards[potentialMatchIndex].content {}
                indexOfTheOneAndOnlyFaceUpCard = nil
                
            } else {
                
                for index in cards.indices {
                    cards[index].isFaceUp = false
                } // for index in cards.indices {}
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                
            } // if let potentialMatchIndex {}
                
            self.cards[chosenIndex].isFaceUp.toggle()
            
        } // if let chosenIndex {}
    } // func choose(card: Card) {}
    
    
    
    
    
} // struct MemoryGame {}
