//
//  ListingImage.swift
//  University Pal
//
import SwiftUI

struct SearchForm: View {
    @StateObject var ctrl:Controller

    @State private var title = ""
    @State private var Author = ""
    @State private var ISBN = ""
    @State private var Subject = ""
    @State private var Price = 0.0

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
                                .frame(width: geo.size.width, height: geo.size.height * 0.4)
                                .edgesIgnoringSafeArea(.top)
                            Text("Search")
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
                                TextField("ISBN", text: $ISBN)
                                    .keyboardType(.numberPad)
                            }
                            Section(header: Text("Subject").font(.headline)){
                                TextField("Subject", text: $Subject)
                            }
                            }

                        }.padding(.vertical, -geo.size.height * 0.07)
                    }
                }
                HStack{
                    //Cancel button
                    Button(action: {
                        // TODO: Add action here
                        title = ""
                        Author = ""
                        Subject = ""
                        ISBN = ""
                    }) {
                        HStack{
                            Image(systemName: "multiply")
                            Text("Cancel")
                                .frame(width: 70, height: 30)
                        }
                    }.buttonStyle(GradButtonStyle(pressedColor: .red))
                    Spacer()

                    //List button
                    Button(action: {
                        if (title == "" && Author == "" && Subject == "" && ISBN == ""){
                            alertTitle = "Please input at least one information"
                            self.showingAlert = true
                        }else{
                            //TODO: Handle sort here
                            ctrl.currView = .profile
                        }
                    }) {
                        HStack{
                            Text("Search")
                                .frame(width: 70, height: 30)
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertTitle))
                        }
                    }.buttonStyle(GradButtonStyle())

                }.padding(.top, -geo.size.height * -0.8)
                    .padding(.horizontal, 40)

            }
        }
    }


struct GradButtonStyle: ButtonStyle{

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


struct SearchForm_Previews: PreviewProvider {
    static var previews: some View {
        SearchForm(ctrl: Controller())
    }
}
