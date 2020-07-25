//
//  ContentView.swift
//  Memorize
//
//  Created by Olivier Van hamme on 25/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        HStack {
            ForEach(0 ..< 6 ) { _ in
                CardView(isFaceUp : true)
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
        ContentView()
    }
}
