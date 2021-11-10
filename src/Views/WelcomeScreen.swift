//
//  WelcomeScreen.swift
//  University Pal
//
//  Created by Luis Alvarez on 11/1/21.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("Books")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    
                LineAccent(Orientation: .Vertical, percentLength: 0.8, lineColor: .white, circleColor: .white)
                    .padding(.leading, 5)
                
                
                VStack(spacing: 0){
                    
                    Section{
                        
                        Text("U")
                            .foregroundColor(.yellow)
                            .font(.system(size: 65))
                            .bold()
                        +
                        Text("niversity")
                            .foregroundColor(.white)
                            .font(.system(size: 65))
                            .bold()
                    }
                    .offset(x: geo.size.width / 25)
                    
                    LineAccent(Orientation: .Horizontal, percentLength: 1, lineColor: .white, circleColor: .white)
                        .frame(width: geo.size.width / 2, height: geo.size.height / 100)
                        .offset(x: -geo.size.width / 4)
                        .rotationEffect(Angle(degrees: 180))
                    
                    Section{
                        Text("P")
                            .foregroundColor(.yellow)
                            .font(.system(size: 65))
                            .bold()
                        +
                        Text("al")
                            .foregroundColor(.white)
                            .font(.system(size: 65))
                            .bold()
                    }
                    .offset(x: geo.size.width / 4)
                    .padding(.bottom, 300)
                    
                    Button(action: {
                        // TODO: Add action here
                    }, label: {
                        Text("Login")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                            .bold()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                            .background(Color("MangoYellow"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                    })
                    
                    Button(action: {
                        // TODO: Add action here
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                            .bold()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                            .background(Color("MangoYellow"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .padding()
                    })
                }
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
