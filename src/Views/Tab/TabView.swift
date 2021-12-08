//
//  TabView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/7/21.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Spacer()
                Text("Sample")
                Spacer()
                HStack{
                    TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "house", tabName: "Home", myView: .WelcomeScreen)
                    TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "message", tabName: "Chat", myView: .WelcomeScreen)
                    TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "person.fill", tabName: "Profile", myView: .profile)
                    TabItem(width: geo.size.width/5, height: geo.size.height/28, systemIconName: "waveform", tabName: "Logout", myView: .WelcomeScreen)
                }
                    .frame(width: geo.size.width, height: geo.size.height/8)
                    .background(Color.gray.shadow(radius: 2))
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
