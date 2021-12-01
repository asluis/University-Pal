//
//  User.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/30/21.
//

import Foundation


class User{
    @Published public var name:String
    @Published public var email:String
    
    init(name:String = "", email:String = ""){
        self.name = name
        self.email = email
    }
}
