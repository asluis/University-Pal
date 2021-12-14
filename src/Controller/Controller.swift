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
    
    func fetchUser(){
        if let userID = Auth.auth().currentUser?.uid { // grabbing userID
            fetchUserData(uid: userID)
            fetchUserListedBooks(uid: userID)
            
        }
    }
    
    func fetchUserListedBooks(uid:String){
        let ref = Database.database().reference()
        ref.child("ListingIndexes").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let uid = (child as AnyObject).key as String
                let val = (child as! DataSnapshot).value as! NSNumber
                let isListed = Bool(truncating: val)
                
                // adds uids to current user only if it's currently set to true--meaning book is still listed
                if isListed {
                    self.currUser.listedIndexes.append(uid)
                }
            }
        })
    }
    
    
    
    func fetchUserData(uid:String){
            let ref = Database.database().reference()
            ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                let data = snapshot.value as? NSDictionary
                let name = data?["name"] as? String ?? "ERR"
                let email = data?["email"] as? String ?? "ERR"
                let univ = data?["university"] as? String ?? "ERR"
                let yr = data?["year"] as? String ?? "ERR"
                self.currUser.setUserValues(name: name, email: email, year: yr, university: univ)
            })
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
        case .SearchForm:
            return AnyView(SearchForm(ctrl: self))
        case .EditLisitng:
            return AnyView(EditListing(ctrl: self))
//        case .ChatView:
//            return AnyView(ChatView(ctrl: self))
        }
    }
}
