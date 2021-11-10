//
//  ChatView.swift
//  University Pal
//
//  Created by 矢野敦也 on 2021/11/01.
//

import SwiftUI

struct ChatView: View {
    var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
                              Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chats) { chat in
                        NavigationLink(
                            destination: ChattingView(),
                            label: {
                                HStack {
                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(chat.name)
                                            Spacer()
                                            Text(timeFormat(date: chat.timestamp))
                                                .foregroundColor(.gray)
                                                .font(.footnote)
                                        }
                                        Text(chat.lastMessage)
                                            .foregroundColor(.gray)
                                            .font(.callout)
                                    }
                                }
                            })
                    }
                }.background(Color.white)
            }.navigationBarTitle("Chats", displayMode: .inline)
        }
    }
}

func timeFormat(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}

struct Chat: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var lastMessage: String
    var timestamp: Date
    var chatId: String
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
