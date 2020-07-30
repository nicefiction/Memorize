//
//  Pie.swift
//  Memorize
//
//  Created by Olivier Van hamme on 30/07/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var startAngle: Angle
    var endAngle: Angle
    var isClockwise: Bool = false
    
    
    
     // //////////////
    //  MARK: METHODS
    
    func path(in rect: CGRect)
        -> Path {
            
            let center = CGPoint(x : rect.midX ,
                                 y : rect.midY)
            
            let radius = min(rect.width , rect.height) / 2
            
            let start = CGPoint(
                x : center.x + radius * cos(CGFloat(startAngle.radians)) ,
                y : center.y + radius * sin(CGFloat(startAngle.radians))
            )
            
            var path: Path = Path()
            path.move(to : center)
            path.addLine(to : start)
            path.addArc(center : center ,
                        radius : radius ,
                        startAngle : startAngle ,
                        endAngle : endAngle ,
                        clockwise : true)
            
            path.addLine(to : center)
            
            
            return path
            
    } // func path(in rect: CGRect) -> Path {}
    
    
    
} // struct Pie: View {}






 // ///////////////
//  MARK: PREVIEWS

struct Pie_Previews: PreviewProvider {
    
    static var previews: some View {
        Pie(startAngle : Angle.degrees(0.00 - 90.00) ,
            endAngle : Angle.degrees(110.00 - 90.00))
        
        
        
    } // static var previews: some View {}
} // struct Pie_Previews: PreviewProvider {}
