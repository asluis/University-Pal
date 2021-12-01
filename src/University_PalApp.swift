//
//  University_PalApp.swift
//  University Pal
//
//  Created by Luis Alvarez on 10/3/21.
//

import SwiftUI
import Firebase

@main
struct University_PalApp: App {
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate

    // initialize anything you need on app startup here
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//Connect Firebase
class Delegate : NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
