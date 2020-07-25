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
        
        return ZStack(content : {
            RoundedRectangle(cornerRadius : 10.0)
                .fill(Color.white)
            RoundedRectangle(cornerRadius : 10.0)
                .stroke(lineWidth : 3.0)
            Text("👻")
        })
            .font(Font.largeTitle)
            .padding()
            .foregroundColor(Color.orange)
    }
     
    
    
    
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
