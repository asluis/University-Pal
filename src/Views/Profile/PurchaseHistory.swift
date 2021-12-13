//
//  PurchaseHistory.swift
//  University Pal
//
//
//  Created by Atsuya Yano


import SwiftUI

struct PurchaseHistory: View {
    @StateObject var ctrl:Controller
    //Sample book list
    var listings: Array<Listings> = [Listings(imageName: "textbooksample", title: "History", author: "Leslie P.", price: 50.55),
                                    Listings(imageName: "sample2", title: "Mathematics", author: "Karen Momison", price: 30.50)]
    
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
                            Text("Purchase History")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        //list of Listing
                        List{
                            ForEach(listings){ listing in
                                HStack{
                                    Image(listing.imageName)
                                        .resizable()
                                        .frame(width: 120, height: 180)
                                        //.scaledToFit()
                                        .edgesIgnoringSafeArea(.top)
                                    
                                    VStack(alignment: .leading){
                                        Text(listing.title).font(.headline)
                                        Text("by " + listing.author).font(.subheadline).foregroundColor(.gray)
                                        Spacer().frame(height: 15)
                                        Text("$ " + String(listing.price)).font(.title)
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

struct PurchaseHistory_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseHistory(ctrl: Controller())
    }
}
