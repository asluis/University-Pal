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
    @State private var Subject:Subject = .Other
    @State private var Price:Float = 0.0
    @State private var image:UIImage?
//    @State private var image:Image = Image(uiImage: UIImage)
    @State private var alertTitle = ""
    @State private var showingAlert = false
    @State private var showingImagePicker = false
    
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
                            Text("Title").frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Title", text: $title)
                            Text("Author").frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Author", text: $Author)
                            Text("ISBN").frame(maxWidth: .infinity, alignment: .leading)
                            TextField("ISBN", value: $ISBN, formatter: NumberFormatter())
                            Section(header: Text("Subject").font(.headline)){
                                Picker("Chose subject", selection: $Subject){
                                    Group{
                                        Text("Mathematics")
                                        Text("Business")
                                        Text("ComputerScience")
                                        Text("Education")
                                        Text("Engineering")
                                        Text("Humanities")
                                        Text("Law")
                                        Text("Social Sciences")
                                        Text("Physics")
                                        Text("Chemistry")
                                    }
                                    Group{
                                        Text("Biology")
                                        Text("MechanicalEngineering")
                                        Text("ElectricalEngineering")
                                        Text("ComputerEngineering")
                                        Text("Medicine")
                                        Text("Other")
                                    }
                                }
                            }
                            Text("Price").frame(maxWidth: .infinity, alignment: .leading)
                            TextField("50;05", value: $Price, formatter: NumberFormatter())
                        }
                    }
                }
            }
            VStack{
                Divider()
                Spacer()
                    .frame(height: 20)
                //Cancel button
                Button(action: {
                    // TODO: Add action here
                }) {
                    Text("Edit")
                        .frame(width: 70, height: 30)
                }.buttonStyle(GradientButtonStyle())
                Spacer()
                    .frame(height: 40)
                
                //List button
                Button(action: {
                    
//                if !(978000000000 < ISBN && ISBN < 9799999999999){
//                    alertTitle = "Invalid ISBN"
//                    self.showingAlert = true
                if (title == "" || Author == ""){
                    alertTitle = "Please input all information"
                    self.showingAlert = true
                }else if !(0 <= Price && Price <= 9999){
                    alertTitle = "Price have to be $0 - $9999"
                    self.showingAlert = true
                }else{
                    //TODO: connect with ListingUploadImage
                    ctrl.tempBook.setBookValues(title: title, author: Author, ISBN: ISBN, subject: Subject, price: Price, image: image)
                    ctrl.currView = .ListingUploadImage
                }
            }) {
                HStack{
                    Image(systemName: "plus.square.fill.on.square.fill")
                    Text("Yes, continue listing")
                        .frame(width: 70, height: 30)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle))
                }
            }.buttonStyle(GradientButtonStyle())
                
            }.padding(.top, -geo.size.height * -0.7)
                .padding(.horizontal, 40)

        }
    }
    
    func setInfo(){
        title = ctrl.tempBook.title
        Author = ctrl.tempBook.author
        ISBN = ctrl.tempBook.ISBN
        Subject = ctrl.tempBook.subject
        Price = ctrl.tempBook.price
        image = ctrl.tempBook.image
    }
}


struct ListingUploadImage_Previews: PreviewProvider {
    static var previews: some View {
        ListingUploadImage(ctrl: Controller())
    }
}
