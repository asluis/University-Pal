//
//  footer.swift
//  University Pal
//


import SwiftUI


struct footer: View {
//    @StateObject var ctrl:Controller
    init(){
            UITabBar.appearance().backgroundColor = UIColor.systemGray5
        }
    
    var body: some View {
        TabView{
            ChatView()
                .tabItem {
                        VStack {
                            Image(systemName: "message")
                                .font(.title)
                            Text("message")
                            }
                        }
//            profile(ctrl: Controller())
//                .tabItem {
//                    VStack{
//                        Image(systemName: "person.circle.fill")
//                            .font(.title)
//                        Text("Profile")
//                    }
//                }

        }
    }
}

struct footer_Previews: PreviewProvider {
    static var previews: some View {
        footer()
    }
}
