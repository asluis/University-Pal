//
//  LogoutView.swift
//  University Pal
//
//  Created by Sadhana Indukuri on 12/4/21.
//

import SwiftUI
import Firebase

struct LogoutView: View {
    
    @StateObject var ctrl:Controller
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("Books")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    
                LineAccent(Orientation: .Vertical, percentLength: 0.8, lineColor: .white, circleColor: .white)
                    .padding(.leading, 5)
                
                LineAccent(Orientation: .Horizontal, percentLength: 1, lineColor: .white, circleColor: .white)
                    .frame(width: geo.size.width / 2, height: geo.size.height / 100)
                    .offset(x: -geo.size.width / 4)
                    .rotationEffect(Angle(degrees: 180))
                
                VStack(spacing: 0){
                    
                    Section{
                        
                        Text("Are you sure you want to logout?")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom, geo.size.height * 0.35)
                            .padding(.top, geo.size.height * 0.25)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .offset(x: geo.size.width / 25)
                    
                    
                    
                
                    
                    
                    Button(action: {
                        ctrl.currView = .WelcomeScreen
                    }, label: {
                        Text("Log out")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .bold()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                    
                }
            }
            }
                
        }

}


struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView(ctrl: Controller())
    }
}
