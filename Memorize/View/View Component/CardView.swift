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
        
        GeometryReader { geometryProxy in
            
            self.body(for : geometryProxy.size)
            
        } // GeometryReader { geometryProxy in }
    } // var body: some View {}
    
    
    
     // //////////////
    //  MARK: METHODS
    
    @ViewBuilder
    private func body(for size: CGSize)
        -> some View {
            
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle : Angle.degrees(0.00 - 90.00) ,
                        endAngle : Angle.degrees(110.00 - 90.00) ,
                        isClockwise : true)
                        .padding(5)
                        .opacity(0.40)
                    
                    Text(self.card.content)
                        .font(Font.system(size : setFontSize(for : size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration : 2.00) : .default)
                } // ZStack {}
                    .cardify(isFaceUp : card.isFaceUp)
            } // if card.isFaceUp || !card.isMatched {}
    } // private func body(for size: CGSize) -> some View {}
    
    
    private func setFontSize(for size: CGSize)
        -> CGFloat {
            
            min(size.width ,
                size.height) * 0.7
    } // func setFontSize(size: CGSize) {}
} // struct CardView: View {}





 // ///////////////
//  MARK: PREVIEWS

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        var card = MemoryGame<String>.Card(id : 1 , content : "👻")
        card.isFaceUp = true
        
        return CardView(card : card)
        
        
        
    } // static var previews: some View {}
} // struct CardView_Previews: PreviewProvider {}
