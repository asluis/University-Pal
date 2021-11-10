//
//  ContentView.swift
//  University Pal
//
//  Created by Luis Alvarez on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hell world")
            .padding()
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



func timeFormat(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}
