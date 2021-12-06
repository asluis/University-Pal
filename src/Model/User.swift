//
//  User.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/30/21.
//

import Foundation

// TODO: Define more attributes of a user
class User{
    @Published public var name:String
    @Published public var email:String
    
    // The indexes tell us which books to get from the Books section of the DB
    @Published public var listedIndexes:[Int] // push to firebase if changed
    @Published public var purchasedIndexes:[Int] // push to firebase if changed
    
    @Published public var listedBooks:[Book] // this is not pushed to firebase
    @Published public var purchasedBooks:[Book] // this is not pushed to firebase
    
    init(name:String = "", email:String = "", listedBooks:[Book] = [Book](), purchasedBooks:[Book] = [Book](), listedIndexes:[Int] = [Int](), purchasedIndexes:[Int] = [Int]()){
        self.name = name
        self.email = email
        self.purchasedBooks = purchasedBooks
        self.listedBooks = listedBooks
        self.purchasedIndexes = purchasedIndexes
        self.listedIndexes = listedIndexes
    }
    
    func setUserValues(name:String? = nil, email:String? = nil, purchasedBooks:[Book]? = nil, listedBooks:[Book]? = nil, listedIndexes:[Int]? = nil, purchasedIndexes:[Int]? = nil){
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
    }
}
