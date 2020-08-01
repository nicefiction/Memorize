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
    //  MARK: PROPERTY WRAPPERS
    
    @State private var animatedBonusRemaining: Double = 0.00
    
    
    
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
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle : Angle.degrees(0.00 - 90.00) ,
                                endAngle : Angle.degrees((-animatedBonusRemaining * 360) - 90.00) ,
                                isClockwise : true)
                                .onAppear(perform : {
                                    self.startBonusTimeAnimation()
                                }) // .onAppear(perform : {})
                        } else {
                            Pie(startAngle : Angle.degrees(0.00 - 90.00) ,
                                endAngle : Angle.degrees((-card.bonusRemaining * 360) - 90.00) ,
                                isClockwise : true)
                        } // if card.isConsumingBonusTime {} else {}
                    } // Group {}
                        .padding(5)
                        .opacity(0.40)
                    
                    
                    Text(self.card.content)
                        .font(Font.system(size : setFontSize(for : size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(
                            card.isMatched
                                ? Animation.linear(duration : 2.00)
                                    .repeatForever(autoreverses : false)
                                : .default)
                } // ZStack {}
                    .cardify(isFaceUp : card.isFaceUp)
                    .transition(AnyTransition.scale)
    } // if card.isFaceUp || !card.isMatched {}
    } // private func body(for size: CGSize) -> some View {}
    
    
    private func setFontSize(for size: CGSize)
        -> CGFloat {
            
            min(size.width ,
                size.height) * 0.7
    } // func setFontSize(size: CGSize) {}
    
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining // OLIVIER : in percentage
        withAnimation(Animation.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        } // withAnimation(Animation.linear(duration: card.bonusTimeRemaining)) {}
    } // private func startBonusTimeAnimation() {}
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
