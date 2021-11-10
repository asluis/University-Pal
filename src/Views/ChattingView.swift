//
//  ChattingView.swift
//  University Pal
//
//  Created by 矢野敦也 on 2021/11/01.
//

import SwiftUI

struct ChattingView: View {
    @State var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
                                     Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    @State var writing: String = ""
    
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        VStack {
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
        }
    }
    private func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
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
            }.background(Color.green)
            .frame(minWidth: 10, maxWidth: 200)
            .cornerRadius(10)
        }
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}
