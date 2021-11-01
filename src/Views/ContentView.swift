//
//  ContentView.swift
//  University Pal
//
//  Created by Luis Alvarez on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContactsView()
                    .navigationBarTitle("", displayMode: .inline)
            }
            .tabItem {  Label("Contacts", systemImage: "rectangle.stack.person.crop.fill")}
            ChatView()
                .tabItem {  Label("Chat", systemImage: "message.fill")}
            //SettingView()
            //    .tabItem {  Label("Settings", systemImage: "gear")}
        }
    }
}

struct ContactsView: View {
    var contacts: Array<Contact> = [Contact(name: "Alice", lastName: "Fish", aliasName: "Alix"),
        Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
    ]
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                NavigationLink(destination: ChattingView(), label: {
                    RowView(contact: contact)
                })
            }
        }
    }
}
struct RowView: View {
    var contact: Contact
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 30, height: 30)
            Text(contact.aliasName)
        }
    }
}

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var lastName: String
    var aliasName: String
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
    }
}

struct Chat: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var lastMessage: String
    var timestamp: Date
    var chatId: String
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

func timeFormat(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}
