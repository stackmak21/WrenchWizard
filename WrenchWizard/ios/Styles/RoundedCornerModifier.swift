//
//  RoundedCornerModifier.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/3/24.
//

import Foundation
import SwiftUI

struct RoundedCornerShape: Shape {
    var tl: CGFloat = 0
    var tr: CGFloat = 0
    var bl: CGFloat = 0
    var br: CGFloat = 0
    
    init(radius: CGFloat, corners: UIRectCorner = .allCorners) {
        if corners.contains(.topLeft) {
            tl = radius
        }
        
        if corners.contains(.topRight) {
            tr = radius
        }
        
        if corners.contains(.bottomLeft) {
            bl = radius
        }
        
        if corners.contains(.bottomRight) {
            br = radius
        }
    }
    
    init(tl: CGFloat, tr: CGFloat, bl: CGFloat, br: CGFloat) {
        self.tl = tl
        self.tr = tr
        self.bl = bl
        self.br = br
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
                
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners) )
    }
    
    func cornerRadius(tl: CGFloat, tr: CGFloat, bl: CGFloat, br: CGFloat) -> some View {
        clipShape(RoundedCornerShape(tl: tl, tr: tr, bl: bl, br: br) )
    }
}
