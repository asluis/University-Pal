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
    @Published var currUser:User = User()
    // TODO: Define model within controller
    
    // Temporary book for storing a book's details between views, this book is not automatically uploaded to firebase
    @Published var tempBook:Book = Book()
    
    
    // Obtains and returns the view to be displayed
    func determineView() -> AnyView{
        switch currView{
        case .WelcomeScreen:
            return AnyView(WelcomeScreen(ctrl: self))
        case .SignUpView:
            return AnyView(SignUpView(ctrl: self))
        case .LoginView:
            return AnyView(LoginView(ctrl: self))
        case .EditLisitng:
            return AnyView(EditListing(ctrl: self))
        case .profile:
            return AnyView(profile(ctrl: self))
        case .PurchaseHistory:
            return AnyView(PurchaseHistory(ctrl: self))
        case .MyListings:
            return AnyView(MyListings(ctrl: self))
        case .ListingInfo:
            return AnyView(ListingInfo(ctrl: self))
        case .ListingUploadImage:
            return AnyView(ListingUploadImage(ctrl: self))
//        case .ChatView:
//            return AnyView(ChatView(ctrl: self))
//        case .footer:
//            return AnyView(footer(ctrl: self))
        }
    }
}
