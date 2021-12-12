//
//  ListingUploadImage.swift
//  University Pal
//
//  Created by Atsuya Yano on 2021/11/17.
//

import SwiftUI
import UIKit

struct ListingUploadImage: View {
    @StateObject var ctrl:Controller
    
    @State private var title:String = ""
    @State private var Author:String = ""
    @State private var ISBN:String = ""
//    @State private var Subject:String = ""
    @State private var subject:Book.Subject = .Other
    @State private var Price:Float = 0.0
    @State private var image:UIImage?
//    @State private var image:Image = Image(uiImage: UIImage)
    @State private var alertTitle = ""
    @State private var showingAlert = false
    @State private var showingImagePicker = false
    @State private var selection = ""
    
    func setInfo(){
        title = ctrl.tempBook.title
        Author = ctrl.tempBook.author
        ISBN = ctrl.tempBook.ISBN
        subject = ctrl.tempBook.subject
        Price = ctrl.tempBook.price
        image = ctrl.tempBook.image
    }

    var body: some View {
        
        
        GeometryReader{ geo in
            VStack{
                Section(header: Group{
                    ZStack{
                        Image("Books")
                            .resizable()
                            .frame(width: geo.size.width, height: geo.size.height * 0.2)
                            .edgesIgnoringSafeArea(.top)
                        Text("Listing")
                            .foregroundColor(.white)
                            .font(.system(size: 65))
                            .bold()
                            .padding(.bottom, 60)
                    }
                }){
                    Text("Is this the book that you want to list?")
                        .font(.system(size: 20))
                        .bold()
                    
                    HStack{
                        VStack{
                            if let uiImage = image {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                            }  else {
                                Image("noimage")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                
                            }
                            Button(action: {
                                showingImagePicker = true
                            }){
                                Text("Input book image")
                            }
                        }
                        .sheet(isPresented: $showingImagePicker){
                            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                        }
                        VStack{
                            Text("Title: \(ctrl.tempBook.title)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("Author: \(ctrl.tempBook.author)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("ISBN: \(ctrl.tempBook.ISBN)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("Subject: \(ctrl.tempBook.subject.rawValue)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("Price: \(ctrl.tempBook.price)").frame(maxWidth: .infinity, alignment: .leading).padding()
                        }
                    }
                }
            }
            VStack{
                Divider()
                Spacer()
                    .frame(height: 20)
                //Edit button
                Button(action: {
                    // TODO: Add action here
                    ctrl.currView = .ListingInfo
                }) {
                    Text("Edit")
                        .frame(width: 70, height: 30)
                }.buttonStyle(GradientButtonStyle())
                Spacer()
                    .frame(height: 40)
                
                //List button
                Button(action: {
                //TODO: connect with ListingUploadImage
                ctrl.tempBook.setBookValues(title: title, author: Author, ISBN: ISBN, subject: subject, price: Price, image: image)
                ctrl.currView = .profile
            }) {
                HStack{
                    Image(systemName: "plus.square.fill.on.square.fill")
                    Text("Yes, continue listing")
                        .frame(width: 170, height: 30)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle))
                }
            }.buttonStyle(GradientButtonStyle())
                
            }.padding(.top, -geo.size.height * -0.7)
                .padding(.horizontal, 40)

        }
    }
}


struct ListingUploadImage_Previews: PreviewProvider {
    static var previews: some View {
        ListingUploadImage(ctrl: Controller())
    }
}
