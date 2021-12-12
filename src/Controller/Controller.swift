//
//  Controller.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/21/21.
//
import Foundation
import SwiftUI
import Firebase

class Controller: ObservableObject{
    

    @Published var currView:ViewBank = .WelcomeScreen
    @Published var currUser:User = User()
    // TODO: Define model within controller
    
    // Temporary book for storing a book's details between views, this book is automatically uploaded to firebase upon calling FireBasePush
    @Published var tempBook:Book = Book()
    
    // book: title, author, ISBN, subject, price, image
    func FirebasePush(book:Book? = nil){
        
        if book != nil {
            tempBook = book!
        }
        
        if let userID = Auth.auth().currentUser?.uid {
            
            let bookData: [String : Any] = [
                "author": tempBook.author as String,
                "title": tempBook.title as String,
                "ISBN": tempBook.ISBN as String,
                "subject": tempBook.subject.rawValue as String,
                "price": tempBook.price as Float,
                //"image": book.image as Image TODO: Find a way to store images in firebase
            ]
            
            let ref = Database.database().reference()
            let key = ref.child("Books").childByAutoId().key
            ref.child("Books").child(key!).setValue(bookData) // pushing new book
            ref.child("ListingIndexes").child(userID).child(key!).setValue(true) // pushing book to user's list of pushed books
            
            
        } else{
            fatalError() // crash if error
        }
    }
    
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
