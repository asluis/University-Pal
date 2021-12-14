//
//  User.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/30/21.
//


import Foundation

// TODO: Define more attributes of a user
class User: ObservableObject{
    @Published public var name:String
    @Published public var email:String
    @Published public var year:String
    @Published public var university:String
    
    // The indexes tell us which books to get from the Books section of the DB
    @Published public var listedIndexes:[String] // push to firebase if changed
    @Published public var purchasedIndexes:[String] // push to firebase if changed
    
    @Published public var listedBooks:[Book] // this is not pushed to firebase
    @Published public var purchasedBooks:[Book] // this is not pushed to firebase
    
    init(name:String = "", email:String = "", listedBooks:[Book] = [Book](), purchasedBooks:[Book] = [Book](), listedIndexes:[String] = [String](), purchasedIndexes:[String] = [String](), university:String = "", year:String = ""){
        self.name = name
        self.email = email
        self.purchasedBooks = purchasedBooks
        self.listedBooks = listedBooks
        self.purchasedIndexes = purchasedIndexes
        self.listedIndexes = listedIndexes
        self.university = university
        self.year = year
    }
    
    func appendToListedIndexes(index:String? = nil, indexes:[String]? = nil){
        if index != nil {
            listedIndexes.append(index!)
        }
        if indexes != nil {
            listedIndexes += indexes!
        }
    }
    
    func appendToPurchasedIndexes(index:String){
        purchasedIndexes.append(index)
    }
    
    func appendToListedBooks(book:Book) {
        listedBooks.append(book)
    }
    
    func appendToPurchasedBooks(book:Book) {
        purchasedBooks.append(book)
    }
    
    func setUserValues(name:String? = nil, email:String? = nil, purchasedBooks:[Book]? = nil, listedBooks:[Book]? = nil, listedIndexes:[String]? = nil, purchasedIndexes:[String]? = nil, year:String? = nil, university:String? = nil){
        if name != nil {
            self.name = name!
        }
        if email != nil {
            self.email = email!
        }
        if purchasedBooks != nil {
            self.purchasedBooks = purchasedBooks!
        }
        if listedBooks != nil {
            self.listedBooks = listedBooks!
        }
        if listedBooks != nil {
            self.listedBooks = listedBooks!
        }
        if listedIndexes != nil {
            self.listedIndexes = listedIndexes!
        }
        if purchasedIndexes != nil {
            self.purchasedIndexes = purchasedIndexes!
        }
        if year != nil {
            self.year = year!
        }
        if university != nil {
            self.university = university!
        }
    }
}
