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
    @State private var password = ""
    @State private var confirmPassword = ""
    
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
                            Section(header: Text("Name").font(.headline)){
                                TextField("Name", text: $name)
                            }
                            Section(header: Text("Email").font(.headline)){
                                TextField("Email", text: $email)
                            }
                            Section(header: Text("Password").font(.headline)){
                                SecureField("Password", text: $password)
                            }
                            Section(header: Text("Confirm Password").font(.headline)){
                                SecureField("Password", text: $confirmPassword)
                            }
                        }.padding(.top, -geo.size.height * 0.07)
                    }
                }
                
                Button(action: {
                    
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: CGFloat(20))
                            .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.08)
                            .padding(.top, geo.size.height * 0.7)
                    }
                })
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
