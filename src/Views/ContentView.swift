//
//  ContentView.swift
//  University Pal
//
//  Created by Luis Alvarez on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var ctrl = Controller() // Holds relevant data
    
    var body: some View {
        TabView(content: ctrl.determineView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
