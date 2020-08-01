//
//  Cardify.swift
//  Memorize
//
//  Created by Olivier Van hamme on 30/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct Cardify: AnimatableModifier {
    
     // ////////////////////////
    //  MARK: Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 2.0

    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var rotation: Double
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var isFaceUp: Bool {
        rotation < 90
    } // var isFaceUp: Bool {}
   
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    } // var isFaceUp: Bool {}
    
    
    
     // //////////////////////////
    //  MARK: INITIALISER METHODS
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    } // init(isFaceUp: Bool) {}
    
    
    
     // /////////////////////
    //  MARK: HELPER METHODS
    
    func body(content: Content)
        -> some View {
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius : cornerRadius)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius : cornerRadius)
                        .stroke(lineWidth : edgeLineWidth)
                    
                    content
                } // Group {}
                    .opacity(isFaceUp ? 1 : 0)
                RoundedRectangle(cornerRadius : cornerRadius)
                    .fill()
                    .opacity(isFaceUp ? 0 : 1)
            } // ZStack {}
                .rotation3DEffect(Angle.degrees(rotation) ,
                                  axis : (0 , 1 , 0))
            
} // func body(content: Content) -> some View {}
} // struct Cardify: ViewModifier {}
