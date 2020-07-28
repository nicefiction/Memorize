//
//  Grid.swift
//  Memorize
//
//  Created by Olivier Van hamme on 28/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct Grid<Item , ItemView>: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var items: Array<Item>
    var viewForItem: (Item) -> ItemView
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
         
    } // var body: some View {}
    
    
    
     // //////////////////////////
    //  MARK: INITIALIZER METHODS
    
    init(items: [Item] ,
         viewForItem: @escaping (Item) -> ItemView) {
        
        self.items       = items
        self.viewForItem = viewForItem
        
    } // init() {}
    
} // struct Grid: View {}
