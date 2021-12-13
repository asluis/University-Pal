//
//  profile.swift
//  University Pal
//
//
//  Created by Atsuya Yano

import SwiftUI

struct editDetail: Identifiable{
    var id: ObjectIdentifier
    var menuList: String
}

struct profile: View {
    @StateObject var ctrl:Controller
    
    // for list of year
    @State private var selection = 5
    
    @State public var name:String = ""
    @State public var email:String = ""
    @State public var listedIndexes:[Int] = []
    @State public var purchasedIndexes:[Int] = []
    @State public var listedBooks:[Book] = []
    @State public var purchasedBooks:[Book] = []
//    @State private var university = ""
    
    
    
    var body: some View {
        
        VStack{
            Image("books-1163695_1").frame(width: UIScreen.main.nativeBounds.size.width, height: 0)
            Text("Profile")
                .foregroundColor(Color.white)
                .font(Font.system(size: 50).bold())
            
            Form{
                Section(header: Text("Basic Information")){
                    HStack{
//                            Image("guy-character")
//                                .resizable()
//                                .clipped()
//                                .frame(width: 100, height: 100, alignment: .center)
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                        
                        VStack{
                            //Name field
                            Text("Name: \(ctrl.currUser.name)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("e-mail: \(ctrl.currUser.email)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("University: \(ctrl.currUser.university)").frame(maxWidth: .infinity, alignment: .leading).padding()
                            Text("Year: \(ctrl.currUser.year)").frame(maxWidth: .infinity, alignment: .leading).padding()
                        
//                                //University name field
//                                Divider()
//                                Text("University").frame(maxWidth: .infinity, alignment: .leading)
//                                TextField("University", text: $university)
                            
                            //Year field
//                                Divider()
//                                Text("Year").frame(maxWidth: .infinity, alignment: .leading)
//                                Picker(selection: $selection, label: Text("")){
//                                    Text("Freshman").tag(1)
//                                    Text("Sophomore").tag(2)
//                                    Text("Junior").tag(3)
//                                    Text("Senior").tag(4)
//                                    Text("Graduated").tag(5)
//                                }
                        }
                    }
//                        Button(action: {
//                            ctrl.currUser.setUserValues(name: name, email: email, purchasedBooks: purchasedBooks, listedBooks: listedBooks, listedIndexes: listedIndexes, purchasedIndexes: purchasedIndexes)
//                        }) {
//                            HStack{
//                                Text("Save")
//                                    .frame(width: 70, height: 30)
//                            }
//                        }.buttonStyle(GradientButtonStyle(pressedColor: .red))
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
                }

            }
        
        }

    }
    
    func setInfo(){
        name = ctrl.currUser.name
        email = ctrl.currUser.email
        listedIndexes = ctrl.currUser.listedIndexes
        purchasedIndexes = ctrl.currUser.purchasedIndexes
        listedBooks = ctrl.currUser.listedBooks
        purchasedBooks = ctrl.currUser.purchasedBooks
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            profile(ctrl: Controller())
        }
    }
}
