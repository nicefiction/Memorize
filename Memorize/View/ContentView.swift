//
//  ContentView.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var viewModel: EmojiMemoryGame
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card : card)
                    .onTapGesture(perform : { self.viewModel.choose(card : card) })
            } // ForEach(0 ..< 6 ) { _ in }
        } // HStack {}
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
        
    } // var body: some View {}
     
    
    
    
} // struct ContentView: View {}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel : EmojiMemoryGame())
    } // static var previews: some View {}
    
} // struct ContentView_Previews: PreviewProvider {}
