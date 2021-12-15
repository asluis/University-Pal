//
//  SearchView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/14/21.
//

import SwiftUI

struct SearchView: View {
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
                            Text("Search")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        //list of Listing
                        List{
                            ForEach(ctrl.search()){ book in
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
                                            //ctrl.currView = .EditLisitng
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(ctrl: Controller())
    }
}
