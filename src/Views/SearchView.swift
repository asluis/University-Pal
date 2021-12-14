//
//  SearchView.swift
//  University Pal
//
//  Created by Nguyen Kim Khanh on 12/12/21.
//

import SwiftUI

struct SearchView: View {
    @StateObject var ctrl:Controller

    //Sample book list
    var products: Array<Products> = [Products(imageName: "textbooksample", title: "History", author: "Leslie P.", price: 50.55),
                Products(imageName: "sample2", title: "Mathematics", author: "Karen Momison", price: 30.50)]
    
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
                        //list of products
                        List{
                            NavigationLink(destination: Text("ListingInfo")){
                                VStack{
                                    ForEach(products){ product in
                                        HStack{
                                            Image(product.imageName)
                                                .resizable()
                                                .frame(width: 120, height: 180)
                                                //.scaledToFit()
                                                .edgesIgnoringSafeArea(.top)
                                            
                                            VStack(alignment: .leading){
                                                Text(product.title).font(.headline)
                                                Text("by " + product.author).font(.subheadline).foregroundColor(.gray)
                                                Spacer().frame(height: 15)
                                                Text("$ " + String(product.price)).font(.title)
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
    }
}

struct Products: Identifiable{
    var id = UUID()
    var imageName: String
    var title: String
    var author: String
    var price: Double
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(ctrl: Controller())
    }
}
