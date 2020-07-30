//
//  Cardify.swift
//  Memorize
//
//  Created by Olivier Van hamme on 30/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct Cardify: ViewModifier {
    
     // ////////////////////////
    //  MARK: Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 2.0

    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var isFaceUp: Bool
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
   
    func body(content: Content)
        -> some View {
       
            ZStack {
                if isFaceUp {
                    RoundedRectangle(cornerRadius : cornerRadius)
                        .stroke(lineWidth : edgeLineWidth)
                    
                    content
                } else {
                    RoundedRectangle(cornerRadius : cornerRadius)
                        .fill()
                } // if card.isFaceUp {} else {}
            } // ZStack {}
        
    } // func body(content: Content) -> some View {}
} // struct Cardify: ViewModifier {}
