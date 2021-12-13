//
//  EditListing.swift
//  University Pal
//
//  Created by Atsuya Yano on 2021/11/23.
//

import SwiftUI

struct EditListing: View {
//    @StateObject var ctrl:Controller
    
    @State private var price = 50.50
    @State private var title = "great math textbook"
    @State private var Author = ""
    @State private var ISBN = 0
    @State private var Subject = ""
    @State private var description = ""
    @State private var image: UIImage?
    @State var showingImagePicker = false
    
    var body: some View {
        ScrollView {
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
                }
            }
            VStack{
                Text("Price").frame(maxWidth: .infinity, alignment: .leading)
                TextField("Price", value: $price, formatter: NumberFormatter())
                Text("Author").frame(maxWidth: .infinity, alignment: .leading)
                TextField("Author", text: $Author)
                Text("ISBN").frame(maxWidth: .infinity, alignment: .leading)
                TextField("ISBN", value: $ISBN, formatter: NumberFormatter())
                Text("Subject").frame(maxWidth: .infinity, alignment: .leading)
                TextField("Subject", text: $Subject)
                Text("Description").frame(maxWidth: .infinity, alignment: .leading)
                TextField("Description", text: $description)
            }.padding(EdgeInsets(
                top:10,
                leading:20,
                bottom:10,
                trailing: 20
            ))
            
            //List button
            Button(action: {
                // TODO: Add action here
            }) {
                Text("Delete")
                    .frame(width: 170, height: 30)
            }.buttonStyle(GradientButtonStyle())
        }

    }
}

struct EditListing_Previews: PreviewProvider {
    static var previews: some View {
        EditListing()
    }
}
