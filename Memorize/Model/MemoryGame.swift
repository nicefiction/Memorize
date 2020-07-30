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
    
    private(set) var cards: Array<Card>
    
    
    
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
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    private var indexOfTheOneAndOnlyFaceUpCard: Optional<Int> {
        get {
            var faceUpCardIndices: Array<Int> = Array<Int>()
            
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                } // if cards[index].isFaceUp =  true {}
            } // for index in cards.indices {}
            
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            } // if faceUpCardIndices.count == 1 {} else {}
        } // get {}
        
        
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                } // if index == newValue {} else {}
            } // for index in cards.indices {}
        } // set {}
    } // var indexOfTheOneAndOnlyFaceUpCard: Optional<Int> {}
    
    
    
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
                
                self.cards[chosenIndex].isFaceUp.toggle()
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            } // if let potentialMatchIndex {}
                
            
        } // if let chosenIndex {}
    } // func choose(card: Card) {}
    
    
    
    
    
} // struct MemoryGame {}
