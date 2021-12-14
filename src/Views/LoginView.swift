//
//  LoginView.swift
//  University Pal
//
//  Created by Luis Alvarez Sanchez on 12/3/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @StateObject var ctrl:Controller
    
    @State private var isShowingAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
    @State private var email = ""
    @State private var password = ""
    
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
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.system(size: 65))
                                .bold()
                                .padding(.bottom, 60)
                        }
                    }){
                        Form{
                            Section(header: Text("Email").font(.headline)){
                                TextField("Email", text: $email)
                                    .autocapitalization(UITextAutocapitalizationType.none)
                            }
                            Section(header: Text("Password").font(.headline)){
                                SecureField("Password", text: $password)
                                    .autocapitalization(UITextAutocapitalizationType.none)
                            }
                        }.padding(.top, -geo.size.height * 0.07)
                    }
                }
                VStack{
                    Spacer()
                    
                    Button(action: {
                        if email == "" || password == "" {
                            alertTitle = "Error Logging in"
                            alertMsg = "Please fill out BOTH email and password"
                            isShowingAlert = true
                        }else{
                            Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
                                
                                if error != nil {
                                    alertTitle = "Error Loggin in"
                                    alertMsg = error?.localizedDescription ?? "Error loggin in"
                                
                                    isShowingAlert = true
                                }else{
                                    // Successful login
                                    email = ""
                                    password = ""
                                    
                                   print("SUCCESS LOGGING IN")
                                    // Now probe database and fetch user data
                                    ctrl.fetchUser()
                                    print("Name and email is: \(ctrl.currUser.name) \(ctrl.currUser.email)")
                                    ctrl.currView = .SearchForm // changing view
                                    
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
    
    // Ensures email is valid format and ends in .edu
    func isValidEmail(_ email:String) -> Bool{
        let emailRegEx = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.+-]+\\.edu$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(ctrl: Controller())
    }
}
