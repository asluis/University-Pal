//
//  Book.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/5/21.
//

import Foundation

class Book{
    @Published public var title:String
    @Published public var author:String
    @Published public var ISBN:String
    @Published public var subject:Subject
    @Published public var price:Float
    
    
    
    
    
}


enum Subject{
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
}
