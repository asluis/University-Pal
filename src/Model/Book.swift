//
//  Book.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/5/21.
//

import Foundation
import SwiftUI

class Book: ObservableObject{
    @Published public var title:String
    @Published public var author:String
    @Published public var ISBN:String
    @Published public var subject:Subject
    @Published public var price:Float
    @Published public var image:UIImage?
    
    // default values assigned
    init(title:String = "", author:String = "", ISBN:String = "", subject:Subject = .Other, price:Float = 0.0, image:UIImage? = UIImage(named: "")){
        self.title = title
        self.author = author
        self.ISBN = ISBN
        self.subject = subject
        self.price = price
        self.image = image
    }
    
    func setBookValues(title:String? = nil, author:String? = nil, ISBN:String? = nil, subject:Subject? = nil, price:Float? = nil, image:UIImage? = nil){
        if title != nil {
            self.title = title!
        }
        if author != nil {
            self.author = author!
        }
        if ISBN != nil {
            self.ISBN = ISBN!
        }
        if subject != nil {
            self.subject = subject!
        }
        if price != nil {
            self.price = price!
        }
        if image != nil {
            self.image = image!
        }
    }
    
    enum Subject : String, CaseIterable, Identifiable, Codable{
        var id: String{ self.rawValue}
        
        case Mathematics
        case Business
        case ComputerScience
        case Education
        case Engineering
        case Humanities
        case Law
        case SocialSciences
        case Physics
        case Chemistry
        case Biology
        case MechanicalEngineering
        case ElectricalEngineering
        case ComputerEngineering
        case Medicine
        case Other
    }
}


