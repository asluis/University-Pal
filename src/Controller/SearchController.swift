//
//  SearchController.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/14/21.
//

import Foundation

class SearchController: ObservableObject{
    
    @Published var ctrl:Controller
    
    @Published var titleQ = ""
    @Published var authorQ = ""
    @Published var ISBNQ = ""
    @Published var subjectQ:Book.Subject = .Other
    
    init(ctrl:Controller){
        self.ctrl = ctrl
    }
    
    // Searches and filters allBooks array based on title,author,ISBN, and subject in order
    func search() -> [Book]{
        var copy = [Book](ctrl.allBooks)
        
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
}
