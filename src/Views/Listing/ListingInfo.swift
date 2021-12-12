//
//  ListingImage.swift
//  University Pal
//
// Created by Atsuya Yano

import SwiftUI

struct ListingInfo: View {
    @StateObject var ctrl:Controller
    
    @State public var title:String = ""
    @State public var Author:String = ""
    @State public var ISBN:String = ""
    @State public var subject:Subject = .Other
    @State public var Price:Float = 0.0
    @State public var image:Image = Image("")
    
    @State private var alertTitle = ""
    @State private var showingAlert = false
    
    
    
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
                            Text("Listing")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        Form{
                            Section(header: Text("Title").font(.headline)){
                                TextField("Title", text: $title)
                            }
                            Section(header: Text("Author").font(.headline)){
                                TextField("Author", text: $Author)
                            }
                            Section(header: Text("ISBN").font(.headline)){
                                TextField("ISBN", value: $ISBN, formatter: NumberFormatter())
                                    .keyboardType(.numberPad)
                            }
                            Section(header: Text("Subject").font(.headline)){
                                Picker("Chose subject", selection: $subject){
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
                            Section(header: Text("Price").font(.headline)){
                                TextField("Price", value: $Price, formatter: NumberFormatter())
                            }
                            
                        }.padding(.vertical, -geo.size.height * 0.07)
                    }
                }
                HStack{
                    //Cancel button
                    Button(action: {
                        // TODO: Add action here
                        ctrl.currView = .profile
                    }) {
                        HStack{
                            Image(systemName: "multiply")
                            Text("Cancel")
                                .frame(width: 70, height: 30)
                        }
                    }.buttonStyle(GradientButtonStyle(pressedColor: .red))
                    Spacer()
                    
                    //List button
                    Button(action: {
                        
//                        if !(978000000000 < ISBN && ISBN < 9799999999999){
//                            alertTitle = "Invalid ISBN"
//                            self.showingAlert = true
                        if (title == "" || Author == ""){
                            alertTitle = "Please input all information"
                            self.showingAlert = true
                        }else if !(0 <= Price && Price <= 9999){
                            alertTitle = "Price have to be $0 - $9999"
                            self.showingAlert = true
                        }else{
                            //TODO: connect with ListingUploadImage
                            ctrl.tempBook.setBookValues(title: title, author: Author, ISBN: ISBN, subject: subject, price: Price, image: image)
                            ctrl.currView = .ListingUploadImage
                        }
                    }) {
                        HStack{
                            Image(systemName: "plus.square.fill.on.square.fill")
                            Text("Next")
                                .frame(width: 70, height: 30)
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertTitle))
                        }
                    }.buttonStyle(GradientButtonStyle())
                    
                }.padding(.top, -geo.size.height * -0.7)
                    .padding(.horizontal, 40)

            }
        }
    }
}

struct GradientButtonStyle: ButtonStyle{
    
    var pressedColor:Color
    
    // assumes green as default pressed color
    init(pressedColor:Color = .green){
        self.pressedColor = pressedColor
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(configuration.isPressed ? pressedColor : Color("MangoYellow"))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}


struct ListingInfo_Previews: PreviewProvider {
    static var previews: some View {
        ListingInfo(ctrl: Controller())
    }
}
