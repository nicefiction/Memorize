//
//  CardView.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
     // /////////////////
    //  MARK: PROPERTIES

    var card: MemoryGame<String>.Card
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES 
    
    var body: some View {
        
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius : 10.0)
                    .stroke(lineWidth : 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius : 10.0)
                    .fill()
            } // if card.isFaceUp {} else {}
        } // ZStack {}
        
        
        
        
    } // var body: some View {}
    
    
    
    
} // struct CardView: View {}





 // ///////////////
//  MARK: PREVIEWS

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card : MemoryGame<String>.Card(id : 1 ,
                                                content : "🌞"))
    }
}
