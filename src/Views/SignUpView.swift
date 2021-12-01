//
//  SignUpView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 11/16/21.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @StateObject var ctrl:Controller
    
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var isShowingAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
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
                            Text("Sign up")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        Form{
                            Section(header: Text("Name").font(.headline)){
                                TextField("Name", text: $name)
                            }
                            Section(header: Text("Email").font(.headline)){
                                TextField("Email", text: $email)
                            }
                            Section(header: Text("Password").font(.headline)){
                                SecureField("Password", text: $password)
                            }
                            Section(header: Text("Confirm Password").font(.headline)){
                                SecureField("Password", text: $confirmPassword)
                            }
                        }.padding(.top, -geo.size.height * 0.07)
                    }
                }
                VStack{
                    Spacer()
                    
                    Button(action: {
                        if !emailIsValid(email){
                                                    
                        } else if email == "" || password == "" || confirmPassword == "" {
                            alertTitle = "Empty fields"
                            alertMsg = "Please fill out BOTH email and password"
                            isShowingAlert = true
                            
                        }else if password != confirmPassword {
                            alertTitle = "Confirm password"
                            alertMsg = "Please make sure you correctly confirm your password"
                            isShowingAlert = true
                        }else{
                            // action. Register here
                            Auth.auth().createUser(withEmail: email, password: password) { Result, error in
                                if error != nil {
                                    alertTitle = "Error creating account"
                                    alertMsg = error?.localizedDescription ?? "Error"
                                    isShowingAlert = true
                                }else{
                                    // Success!
                                    
                                    print("SUCCESSFUL REGISTRATION for \(email)!")
                                    ctrl.currView = .
                                }
                            }
                        }
                    }, label: {
                        Text("Sign in")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .bold()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.1)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    })
                        .padding(.bottom, geo.size.height * 0.05)
                }
                LineAccent(Orientation: .Vertical, percentLength: 0.9, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                    .padding(.leading, 5)
                LineAccent(Orientation: .Horizontal, percentLength: 0.5, lineColor: .yellow, circleColor: .black, lineWidth: 5)
                    .rotationEffect(Angle(degrees: 180))
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("Dismiss")))
            }
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(ctrl: Controller())
    }
}
