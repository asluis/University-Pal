//
//  Controller.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/21/21.
//
import Foundation
import SwiftUI

class Controller: ObservableObject{
    
    @Published var currView:ViewBank = .WelcomeScreen
    
    // TODO: Define user and model within controller
    
    
    // Obtains and returns the view to be displayed
    func determineView() -> AnyView{
        switch currView{
        case .WelcomeScreen:
            return AnyView(WelcomeScreen(ctrl: self))
        case .SignUpView:
            return AnyView(SignUpView(ctrl: self))
        }
    }
}
