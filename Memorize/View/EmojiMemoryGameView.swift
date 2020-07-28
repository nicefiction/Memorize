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
        
        Grid(self.viewModel.cards) { card in
            CardView(card : card)
                .onTapGesture(perform : {
                    self.viewModel.choose(card : card)
                }) // .onTapGesture(perform : {})
        } // HStack {}
            .padding()
            .foregroundColor(Color.orange)
        
        
        
    } // var body: some View {}
} // struct ContentView: View {}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        EmojiMemoryGameView(viewModel : EmojiMemoryGame())
    } // static var previews: some View {}
    
} // struct ContentView_Previews: PreviewProvider {}
