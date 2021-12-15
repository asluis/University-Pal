//
//  EditListing.swift
//  University Pal
//
//  Created by Atsuya Yano on 2021/11/23.
//

import SwiftUI

struct EditListing: View {
    @StateObject var ctrl:Controller
    
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
                        Image("sample2")
                            .resizable()
                            .frame(width: 200, height: 200)
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
                Text("\(ctrl.tempBook.title)")
                    .font(.title3)
            }
            VStack(alignment: .leading){
                HStack(alignment: .bottom){
                    Text("Price: ")
                    Text("\(ctrl.tempBook.price, specifier: "%.2f")")
                }
                HStack{
                    Text("Author: ")
                    Text("\(ctrl.tempBook.author)")
                }
                HStack{
                    Text("ISBN: ")
                    Text("\(ctrl.tempBook.ISBN)")
                }
                HStack{
                    Text("Subject: ")
                    Text("\(ctrl.tempBook.subject.rawValue)")
                }
                HStack{
                    Text("Description: ")
                    Text("\(description)")
                }
            }
            
            //Delete button
            Button(action: {
                // TODO: Add action here
                ctrl.currView = .profile
            }) {
                Text("Delete")
                    .frame(width: 170, height: 30)
            }.buttonStyle(GradientButtonStyle())
        }

    }
}

struct EditListing_Previews: PreviewProvider {
    static var previews: some View {
        EditListing(ctrl: Controller())
    }
}
