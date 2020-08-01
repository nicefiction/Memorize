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
        
        
        
         // /////////////////
        //  MARK: BONUS TIME
        
        /* This could give matching bonus points
         * if the human matches the card
         * before a certain amount of time passes
         * during which the card is face up .
         * This can be zero
         * which means "no bonus points available" for this card .
         */
        var bonusTimeLimit: TimeInterval = 6
        
        
        /* How long this card has ever been face up :
         */
        private var faceUpTime: TimeInterval {
            
            if
                let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            } // if let lastFaceUpDate {} else {}
            
        } // private var faceUpTime: TimeInterval {}
        
        
        /* The last time this card was turned face up (and is still face up) :
         */
        var lastFaceUpDate: Date?
        
        
        /* The accumulated time this card has been face up in the past
         * (i.e. not including the current time it is been face up if it is currently so)
         */
        var pastFaceUpTime: TimeInterval = 0
        
        
        /* How much time left before the bonus opportunity runs out :
         */
        var bonusTimeRemaining: TimeInterval {
            max(0 , bonusTimeLimit - faceUpTime)
        } // var bonusTimeRemaining: TimeInterval {}
        
        
        /* Percentage of the bonus time remaining :
         */
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining / bonusTimeLimit : 0
        } // var bonusRemaining: Double {}
        
        
        /* Whether the card was matched during the bonus time period :
         */
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        } // var hasEarnedBonus: Bool {}
        
        
        /* Whether we are currently face up ,
         * unmatched ,
         * and have not yet used up the bonus window :
         */
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        } // var isConsumingBonusTime: Bool {}
        
        
        /* Called when the card transitions to face up state :
         */
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime , lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            } // if isConsumingBonusTime , lastFaceUpDate == nil {}
        } // private mutating func startUsingBonusTime() {}
        
        
        /* Called when the card goes back face down (or gets matched) :
         */
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        } // private mutating func stopUsingBonusTime() {}
        
        
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
        
        
        cards.shuffle()
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
