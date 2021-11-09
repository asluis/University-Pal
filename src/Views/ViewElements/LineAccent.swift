//
//  LineAccent.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/7/21.
//

import SwiftUI

struct LineAccentTest: View {
    var body: some View {
        HStack{
            LineAccent(Orientation: .Horizontal, percentLength: 0.8)
            LineAccent(Orientation: .Vertical, percentLength: 1)


        }
    }
}

enum Orientation{
    case Horizontal
    case Vertical
}

struct LineAccent: View{
    let orientation:Orientation
    let lineColor:Color
    let circleColor:Color
    let percentLength: CGFloat
    let lineWidth:CGFloat
    
    init(Orientation: Orientation, percentLength:CGFloat = 1, lineColor:Color = .black, circleColor:Color = .black, lineWidth:CGFloat = 7){
        self.orientation = Orientation
        self.lineColor = lineColor
        self.circleColor = circleColor
        self.percentLength = percentLength
        self.lineWidth = lineWidth
    }
    
    var body: some View{
        GeometryReader{ geo in
            
            // determine whether to show vertical or horizontal line
            if orientation == .Vertical{
                let lineXWidthFactor = lineWidth / geo.size.width
                VStack(spacing: 0){
                    Rectangle()
                        .fill(lineColor)
                        .frame(width: geo.size.width * lineXWidthFactor , height: geo.size.height * percentLength)
                    Circle()
                        .fill(circleColor)
                        .frame(width:  20, height: 20)
                }
            } else {
                let lineYWidthFactor = lineWidth / geo.size.height
                HStack(spacing: 0){
                    Rectangle()
                        .fill(lineColor)
                        .frame(width: geo.size.width * percentLength , height: geo.size.height * lineYWidthFactor)
                    Circle()
                        .fill(circleColor)
                        .frame(width:  15, height: 15)
                }
            }
        }
    }
}

struct LineAccent_Previews: PreviewProvider {
    static var previews: some View {
        LineAccentTest()
    }
}
