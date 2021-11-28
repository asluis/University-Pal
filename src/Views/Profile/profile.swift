//
//  profile.swift
//  University Pal
//
//

import SwiftUI

struct editDetail: Identifiable{
    var id: ObjectIdentifier
    var menuList: String
}

struct profile: View {
    @StateObject var ctrl:Controller
    
    @State private var selection = 5
    @State private var name = ""
    @State private var university = ""
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Image("books-1163695_1").frame(width: UIScreen.main.nativeBounds.size.width, height: 20)
                Text("Profile")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 50).bold())
                
                Form{
                    Section(header: Text("Basic Information")){
                        HStack{
                            Image("guy-character")
                                .resizable()
                                .clipped()
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                            
                            VStack{
                                //Name field
                                Text("Name").frame(maxWidth: .infinity, alignment: .leading)
                                TextField("Name", text: $name)
                            
                                //University name field
                                Divider()
                                Text("University").frame(maxWidth: .infinity, alignment: .leading)
                                TextField("University", text: $university)
                                
                                //Year field
                                Divider()
                                Text("Year").frame(maxWidth: .infinity, alignment: .leading)
                                Picker(selection: $selection, label: Text("")){
                                    Text("Freshman").tag(1)
                                    Text("Sophomore").tag(2)
                                    Text("Junior").tag(3)
                                    Text("Senior").tag(4)
                                    Text("Graduated").tag(5)
                                }
                            }
                        }
                    }
                    List{
                        Button(action: {
                                ctrl.currView = .ListingInfo
                        }, label:{
                            Text("Add Listing")

                        })
                        Button(action: {
                                ctrl.currView = .MyListings
                        }, label:{
                            Text("My Listing")

                        })
                        Button(action: {
                            ctrl.currView = .PurchaseHistory
                        }, label: {
                            Text("Purchase History")
                        })
                        
//                        NavigationLink(destination: ListingInfo()) {
//                            Text("Add Listing").font(.title)
//                        }
//                        NavigationLink(destination: MyListings()) {
//                            Text("My Listing").font(.title)
//                        }
//                        NavigationLink(destination: PurchaseHistory()) {
//                            Text("Purchase History").font(.title)
//                        }
                    }

                }
            
            }
                
        }
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            profile(ctrl: Controller())
        }
    }
}
