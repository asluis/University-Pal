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
    @Published var allBooks:[Book] = [Book]()
    @Published var allIndexes = [String]()
    // TODO: Define model within controller
    
    // Temporary book for storing a book's details between views, this book is automatically uploaded to firebase upon calling FireBasePush
    @Published var tempBook:Book = Book()
    
    @Published var titleQ = ""
    @Published var authorQ = ""
    @Published var ISBNQ = ""
    @Published var subjectQ:Book.Subject = .Other
    

    
    // Searches and filters allBooks array based on title,author,ISBN, and subject in order
    func search() -> [Book]{
        var copy = [Book](allBooks)
        
        if titleQ != "" {
            copy = copy.filter { $0.title == titleQ }
        }
        if authorQ != "" {
            copy = copy.filter { $0.author == authorQ }
        }
        if ISBNQ != "" {
            copy = copy.filter { book in book.ISBN == ISBNQ }
        }
        if subjectQ != .Other {
            copy = copy.filter { book in book.subject == subjectQ }
        }
        
        return copy
    }
    
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
        currUser.listedBooks = [Book]() // re initializing var
        currUser.listedIndexes = [String]()// re initializing var
        if let userID = Auth.auth().currentUser?.uid { // grabbing userID
            fetchUserData(uid: userID)
            
            fetchUserListedBooks(uid: userID, callback: { list in
                self.currUser.appendToListedIndexes(indexes: list)
                print("DATA: \(list)")
                self.fetchBook(bookIDS: self.currUser.listedIndexes)
            })
        }
        fetchAllBooks(callback: { list in
            self.allIndexes += list
            print("AllIndexes SIZE: \(self.allIndexes.count)")
            
            for id in self.allIndexes {
                self.fetchGeneralBook(bookID: id)
            }
            print("allBooks size: \(self.allBooks.count)")
        })
        
        
        
    }
    
    func fetchAllBooks(callback: @escaping([String]) -> Void){
        allIndexes = [String]()
        allBooks = [Book]()
        var indexes = [String]()
        let ref = Database.database().reference()
        ref.child("Books").observeSingleEvent(of: .value, with: { snapshot in
            for id in snapshot.children {
                let bookID = (id as AnyObject).key as String
                indexes.append(bookID)
            }
            callback(indexes)
        })
    }
    
    func fetchGeneralBook(bookID:String){
        let ref = Database.database().reference()
        ref.child("Books").child(bookID).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let data = snapshot.value as? NSDictionary
            
            let ISBN = data?["ISBN"] as? String ?? "ERR"
            let author = data?["author"] as? String ?? "ERR"
            let price = data?["price"] as? Float ?? 0.0
            let subject = data?["subject"] as? Book.Subject ?? .Other
            let title = data?["title"] as? String ?? "ERR"
            
            let newBook = Book(title: title, author: author, ISBN: ISBN, subject: subject, price: price)
            print("Adding ALLbook: \(newBook.title)")
            self.allBooks.append(newBook) // add book fetched from DB to user list
        })
    }
    
    func fetchUserListedBooks(uid:String, callback: @escaping([String]) -> Void){
        let ref = Database.database().reference()
        ref.child("ListingIndexes").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            var listedIndexes = [String]()
            for child in snapshot.children {
                let uid = (child as AnyObject).key as String
                let val = (child as! DataSnapshot).value as! NSNumber
                let isListed = Bool(truncating: val)
                // adds uids to current user only if it's currently set to true--meaning book is still listed
                if isListed {
                    listedIndexes.append(uid)
                }
            }
            callback(listedIndexes)
        })
        
    }
    
    // fetches book from DB and adds it to currUser's list. Input can be either an individual ID or a list of IDs
    func fetchBook(bookID:String? = nil, bookIDS:[String]? = nil){
        let ref = Database.database().reference()
        
        if bookID != nil {
            fetchBook(bookID: bookID!, ref: ref)
        }
        
        if bookIDS != nil {
            for id in bookIDS! {
                fetchBook(bookID: id, ref: ref)
            }
        }
    }
    
    private func fetchBook(bookID:String?, ref:DatabaseReference){
        ref.child("Books").child(bookID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let data = snapshot.value as? NSDictionary
            
            let ISBN = data?["ISBN"] as? String ?? "ERR"
            let author = data?["author"] as? String ?? "ERR"
            let price = data?["price"] as? Float ?? 0.0
            let subject = data?["subject"] as? Book.Subject ?? .Other
            let title = data?["title"] as? String ?? "ERR"
            
            let newBook = Book(title: title, author: author, ISBN: ISBN, subject: subject, price: price)
            print("Adding book: \(newBook.title)")
            self.currUser.appendToListedBooks(book: newBook) // add book fetched from DB to user list
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
        case .SearchView:
            return AnyView(SearchView(ctrl: self))
//        case .ChatView:
//            return AnyView(ChatView(ctrl: self))
        }
    }
}
