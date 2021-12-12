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
    
    @State private var title = "great math textbook"
    @State private var Author = ""
    @State private var ISBN = 0
    @State private var Subject = ""
    @State private var Price = 0
    @State private var image: UIImage?
    @State var showingImagePicker = false
    
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
                            } else {
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
                            Text("Subject").frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Subject", text: $Subject)
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
                    // TODO: Add action here
                }) {
                    Text("Yes, continute listing")
                        .frame(width: 170, height: 30)
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
