//
//  CardView.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
     // ////////////////////////
    //  MARK: Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    
    
    private func setFontSize(for size: CGSize)
        -> CGFloat {
            
            min(size.width ,
                size.height) * 0.75
    } // func setFontSize(size: CGSize) {}
    
    
    
     // /////////////////
    //  MARK: PROPERTIES

    var card: MemoryGame<String>.Card
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        GeometryReader { geometryProxy in
            
            self.body(for : geometryProxy.size)
            
        } // GeometryReader { geometryProxy in }
    } // var body: some View {}
    
    
    
     // //////////////
    //  MARK: METHODS
    
    private func body(for size: CGSize)
        -> some View {
            
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius : cornerRadius)
                    .stroke(lineWidth : edgeLineWidth)
                Text(self.card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius : cornerRadius)
                        .fill()    
                } // if !card.isMatched {}
            } // if card.isFaceUp {} else {}
        } // ZStack {}
            .font(Font.system(size : setFontSize(for : size)))
            
    } // func body(for size: CGSize) -> some View {}
    
    
    
    
    
    
} // struct CardView: View {}





 // ///////////////
//  MARK: PREVIEWS

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card : MemoryGame<String>.Card(id : 1 ,
                                                content : "🌞"))
    }
}
