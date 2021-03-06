//
//  MyListings.swift
//  University Pal
//
//
//  Created by Atsuya Yano


import SwiftUI

struct MyListings: View {
    @StateObject var ctrl:Controller

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
                            Text("My Listings")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        //list of Listing
                        List{
                            ForEach(ctrl.currUser.listedBooks){ book in
                                HStack{
                                    Image("sample2")
                                        .resizable()
                                        .frame(width: 120, height: 180)
                                        //.scaledToFit()
                                        .edgesIgnoringSafeArea(.top)
                                    
                                    VStack(alignment: .leading){
                                        Text(book.title).font(.headline)
                                        Text("by " + book.author).font(.subheadline).foregroundColor(.gray)
                                        Spacer().frame(height: 15)
                                        Text("$ " + String(book.price)).font(.title)
                                        
                                        //See detail button
                                        Button(action: {
                                            // TODO: Add action here\
                                            ctrl.tempBook = book
                                            ctrl.currView = .EditLisitng
                                        }) {
                                            Text("Detail")
                                                .frame(width: 80, height: 10)
                                        }.buttonStyle(GradientButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Listings: Identifiable{
    var id = UUID()
    var imageName: String
    var title: String
    var author: String
    var price: Double
    // imageID = int
    // sellerID = int
    
}

struct MyListings_Previews: PreviewProvider {
    static var previews: some View {
        MyListings(ctrl: Controller())
    }
}
