//
//  SignUpView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/16/21.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var name = ""
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack{
                    Section(header: Group{
                        ZStack{
                            Image("Books")
                                .resizable()
                                .frame(width: geo.size.width, height: geo.size.height * 0.2)
                                .edgesIgnoringSafeArea(.top)
                            Text("Sign up")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        Form{
                            Section(header: Text("Name").font(.subheadline)){
                                TextField("Name", text: $name)
                            }
                            Section(header: Text("Email").font(.subheadline)){
                                TextField("Email", text: $email)
                            }
                        }.padding(.top, -geo.size.height * 0.07)
                    }
                    
                }
                LineAccent(Orientation: .Vertical, percentLength: 0.9, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                    .padding(.leading, 5)
                LineAccent(Orientation: .Horizontal, percentLength: 0.5, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                    .rotationEffect(Angle(degrees: 180))
            }
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
