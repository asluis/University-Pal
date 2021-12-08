//
//  TabItem.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/7/21.
//

import SwiftUI

struct TabItem: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    let myView:ViewBank
         
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
     }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(width: 50, height: 50, systemIconName: "homekit", tabName: "Home", toView: .WelcomeScreen)
    }
}
