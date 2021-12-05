//
//  ChattingView.swift
//  University Pal
//
//

import SwiftUI
import Firebase


struct ChattingView: View {
        
    
    @State var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
                                     Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    @State var alertTitle = ""
    @State var writing: String = ""
    
    @State var name:String = "" // TODO: Use controller to reference user's name
    
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
  
        VStack {
            Image("books-1163695_1").frame(width: UIScreen.main.nativeBounds.size.width, height: 0)
            Text("Athalia Putri")
                .foregroundColor(Color.white)
                .font(Font.system(size:25).bold())
            // Chat
            List {
                ForEach(chats) { chat in
                    if chat.name == "Bob" {
                        UserRowView(chat: chat)
                    } else {
                        ChatRowView(chat: chat)
                    }
                }
            }.background(Color.gray)
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Chatting", displayMode: .inline)
            .onTapGesture {
                self.endEditing()
            }
            // Input
            HStack() {
                TextEditor(text: $writing)
                    .frame(minHeight: 0, maxHeight: 50)
                    .border(Color.gray)
                
                Button(action: {
                    chats.append(Chat(name: "Bob", image:"", lastMessage: writing, timestamp: Date(), chatId: ""))
                    writing = ""
                    self.endEditing()
                }, label: {
                    Image(systemName: "paperplane")
                })
                
            }.ignoresSafeArea(.keyboard, edges: .bottom)
            .padding()
            .background(Color.white)
        }
    }
    private func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
    
    func setData(){
        
    }
    
    func pushData(){
        if let user = Auth.auth().currentUser{
            let userChageRequest = user.createProfileChangeRequest()
            userChageRequest.displayName = name
            userChageRequest.commitChanges{ error in
                if error != nil{
                    alertTitle = "Error"
                }
            }
        }
    }
}

struct UserRowView: View {
    var chat: Chat
    var body: some View {
        HStack {
            Spacer()
            VStack (alignment: .trailing){
                HStack() {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(chat.lastMessage)
                            .padding()
                    }
                }
                Text(timeFormat(date: chat.timestamp))
                    .padding(2)
                    .font(.caption)
                    .foregroundColor(.white)
            }.background(Color.gray)
            .frame(minWidth: 10, maxWidth: 200)
            .cornerRadius(10)
        }
    }
}

struct ChatRowView: View {
    var chat: Chat
    var body: some View {
        VStack (alignment: .trailing){
            HStack() {
                Image(systemName: chat.image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text(chat.lastMessage)
                Spacer()
            }.frame(maxWidth: 200)
            Text(timeFormat(date: chat.timestamp))
                .padding(2)
                .font(.caption)
                .foregroundColor(.white)

        }.background(Color.blue)
        .cornerRadius(10)
        //.border(Color.red, width: 5).cornerRadius(10)
        
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}
