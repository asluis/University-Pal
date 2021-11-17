//
//  SignUpView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/16/21.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        GeometryReader{ geo in
            VStack{
                NavigationView{
                    VStack{
                        Text("Hello there")
                            .toolbar{
                                ToolbarItem(placement: .principal){
                                    Image("Books")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width, height: geo.size.height)
                                        .edgesIgnoringSafeArea(.top)
                                    
                                }
                            }
                        Text("Bobby")
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            LineAccent(Orientation: .Vertical, percentLength: 0.9, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                .padding(.leading, 5)
            LineAccent(Orientation: .Horizontal, percentLength: 0.5, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                .rotationEffect(Angle(degrees: 180))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
