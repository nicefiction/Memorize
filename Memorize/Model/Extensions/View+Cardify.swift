//
//  View+Cardify.swift
//  Memorize
//
//  Created by Olivier Van hamme on 30/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


extension View {
    
    func cardify(isFaceUp: Bool)
        -> some View {
            
            self.modifier(Cardify(isFaceUp : isFaceUp))
        
    } // func cardify(content: Content) -> some View {}
    
} // extension View {}
