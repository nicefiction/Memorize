//
//  Grid.swift
//  Memorize
//
//  Created by Olivier Van hamme on 28/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct Grid<Item , ItemView>: View
    where Item: Identifiable , ItemView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    private var items: Array<Item>
    private var viewForItem: (Item) -> ItemView
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        GeometryReader { geometryProxy in
            
            self.body(for : GridLayout(itemCount : self.items.count ,
                                       in : geometryProxy.size))
            
        } // GeometryReader { geometryProxy in }
    } // var body: some View {}
    
    
    
     // //////////////////////////
    //  MARK: INITIALIZER METHODS
    
    init(items: [Item] ,
         viewForItem: @escaping (Item) -> ItemView) {
        
        self.items       = items
        self.viewForItem = viewForItem
        
    } // init() {}
    
    
    
     // //////////////
    //  MARK: METHODS
    
    private func body(for layout: GridLayout)
        -> some View {
            
            ForEach(items) { item in
                self.body(for : item ,
                          in : layout)
            } // ForEach(items) { item in }
    } // func body(for items: [Item]) -> some View {}
    
    
    private func body(for item: Item ,
              in layout: GridLayout)
        -> some View {
            
            let index = items.firstIndex(matching : item)!
            
            return viewForItem(item)
                .frame(width : layout.itemSize.width ,
                       height : layout.itemSize.height)
                .position(layout.location(ofItemAt : index))
    } // func body(for items: [Item]) -> some View {}
    
     
} // struct Grid: View {}
