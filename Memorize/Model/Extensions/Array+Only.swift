//
//  Array+Only.swift
//  Memorize
//
//  Created by Olivier Van hamme on 29/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import Foundation


extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    } // var only: Element {}
    
} // extension Array {}
