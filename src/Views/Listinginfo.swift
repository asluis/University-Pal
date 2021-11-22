//
//  ListingImage.swift
//  University Pal
//

import SwiftUI

struct ListingInfo: View {
    @StateObject var ctrl:Controller
    
    @State private var title = ""
    @State private var Author = ""
    @State private var ISBN = 0
    @State private var Subject = ""
    
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
                            }
                            Section(header: Text("Subject").font(.headline)){
                                TextField("Subject", text: $Subject)
                            }
                        }.padding(.vertical, -geo.size.height * 0.07)
                    }
                }
                HStack{
                    //Cancel button
                    Button(action: {
                        // TODO: Add action here
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
                        // TODO: Add action here
                    }) {
                        HStack{
                            Image(systemName: "plus.square.fill.on.square.fill")
                            Text("List")
                                .frame(width: 70, height: 30)
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
