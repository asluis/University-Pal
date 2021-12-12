//
//  TabView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/7/21.
//

import SwiftUI

struct TabView: View {
    
    @StateObject var ctrl:Controller
    
    var body: some View {
        GeometryReader{ geo in
            VStack(spacing: 0){
                ctrl.determineView()
                if (ctrl.currView != .LoginView && ctrl.currView != .WelcomeScreen && ctrl.currView != .SignUpView) {
                    HStack{
                        TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "house", tabName: "Home", myView: .SearchForm, ctrl: ctrl)
                        TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "message", tabName: "Chat", myView: .WelcomeScreen, ctrl: ctrl)
                        TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "person.fill", tabName: "Profile", myView: .profile, ctrl: ctrl)
                        TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "waveform", tabName: "Logout", myView: .WelcomeScreen, ctrl: ctrl)
                    }
                    .frame(width: geo.size.width, height: geo.size.height/8)
                    .background(Color.gray.shadow(radius: 2))
                }
                
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(ctrl: Controller())
    }
}
