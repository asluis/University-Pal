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
    @Published public var listedBooks:[Book]
    @Published public var purchasedBooks:[Book]
    
    init(name:String = "", email:String = "", listedBooks:[Book] = [Book](), purchasedBooks:[Book] = [Book]()){
        self.name = name
        self.email = email
        self.purchasedBooks = purchasedBooks
        self.listedBooks = listedBooks
    }
}
