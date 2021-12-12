//
//  SearchForm.swift
//  University Pal
//
//  Created by Nguyen Kim Khanh on 12/11/21.
//

import SwiftUI
import FirebaseAuth

struct SearchForm: View {
    @StateObject var ctrl:Controller
    
    @State private var title = ""
    @State private var author = ""
    @State private var isbn = ""
    @State private var confirmPassword = ""
    
    @State private var isShowingAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack{
                    Section(header: Group{
                        ZStack{
                            Image("Books")
                                .resizable()
                                .frame(width: geo.size.width, height: geo.size.height * 0.2)
                                .edgesIgnoringSafeArea(.top)
                            Text("Search")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        Form{
                            Section(header: Text("Title").font(.headline)){
                                TextField("Title", text: $title)
                                    .autocapitalization(UITextAutocapitalizationType.none)
                            }
                            Section(header: Text("Author").font(.headline)){
                                TextField("Author", text: $author)
                                    .autocapitalization(UITextAutocapitalizationType.none)
                            }
                            Section(header: Text("ISBN").font(.headline)){
                                SecureField("ISBN", text: $isbn)
                                    .autocapitalization(UITextAutocapitalizationType.none)
                            }
                        }.padding(.top, -geo.size.height * 0.07)
                    }
                }
                VStack{
                    Spacer()
                    
                    Button(action: {
                        if !isValidTitle(title) || !isValidISBN(isbn) || !isValidAuthor(author){
                            alertTitle = "Bad information"
                            alertMsg = "Please enter the correct information"
                            isShowingAlert = true
                        } else if title == "" && isbn == "" && author == ""{
                            alertTitle = "Empty fields"
                            alertMsg = "Please enter at least one information"
                            isShowingAlert = true
                        }
                    }, label: {
                        Text("Search")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .bold()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                        .padding(.bottom, geo.size.height * 0.05)
                }
                LineAccent(Orientation: .Vertical, percentLength: 0.9, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                    .padding(.leading, 5)
                LineAccent(Orientation: .Horizontal, percentLength: 0.5, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                    .rotationEffect(Angle(degrees: 180))
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("Dismiss")))
            }
            
        }
    }
    
    func isValidTitle(_ title:String) -> Bool{
        let authorRegEx = "abcd1234-=+-&%$!"
        let authorPred = NSPredicate(format:"SELF MATCHES %@", authorRegEx)
        return authorPred.evaluate(with: author)
    }
    func isValidAuthor(_ author:String) -> Bool{
        let authorRegEx = "abcd"
        let authorPred = NSPredicate(format:"SELF MATCHES %@", authorRegEx)
        return authorPred.evaluate(with: author)
    }
    func isValidISBN(_ isbn:String) -> Bool{
        let authorRegEx = "12345"
        let authorPred = NSPredicate(format:"SELF MATCHES %@", authorRegEx)
        return authorPred.evaluate(with: author)
    
}

struct SearchForm_Previews: PreviewProvider {
    static var previews: some View {
        SearchForm(ctrl: Controller())
    }
}
}
