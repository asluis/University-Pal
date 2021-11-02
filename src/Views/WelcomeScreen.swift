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
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("UNIVERSITY PAL")
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .font(.system(size: 45))
                        .bold()
                        .padding()
                    
                    Spacer()
                    /*
                    Button(action: {}, label: {
                        Text("Login")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                            .bold()
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.1)
                            .background(Color("PinkRed"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                    })
                    
                    Button(action: {}, label: {
                        Text("Create Account")
                            .foregroundColor(.black)
                            .font(.system(size: 35))
                            .bold()
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.1)
                            .background(Color("MangoYellow"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                    })
                    
                    */
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
