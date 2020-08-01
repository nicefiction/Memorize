//
//  ContentView.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Grid(items : self.viewModel.cards) { card in
                CardView(card : card)
                    .onTapGesture(perform : {
                        withAnimation(Animation.linear(duration : 0.75)) {
                            self.viewModel.choose(card : card)
                        } // withAnimation(Animation.linear(duration: 2.00)) {}
                    }) // .onTapGesture(perform : {})
                .padding(5)
            } // Grid(items : self.viewModel.cards) { card in }
                .padding()
                .foregroundColor(Color.orange)
            
            
            Button(action : {
                
                withAnimation(Animation.easeInOut) {
                    self.viewModel.resetGame()
                } // withAnimation() {}
                
            }) {
                Text("New Game")
            } // Button(action : {}) {}
        } // VStack {}
        
        
        
    } // var body: some View {}
} // struct ContentView: View {}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let emojiMemoryGame: EmojiMemoryGame = EmojiMemoryGame()
        emojiMemoryGame.choose(card: emojiMemoryGame.cards[0])
        
        
        return EmojiMemoryGameView(viewModel : emojiMemoryGame)
        
        
        
    } // static var previews: some View {}
} // struct ContentView_Previews: PreviewProvider {}
