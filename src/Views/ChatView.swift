//
//  ChatView.swift
//  University Pal
//
//

import SwiftUI

struct ChatView: View {
    var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
                              Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    init() {
            // Large Title Text Color
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableView.appearance().separatorStyle = .singleLine
            UITableView.appearance().separatorColor = UIColor.white.withAlphaComponent(0.6)
            UITableViewCell.appearance().backgroundColor = .clear
        }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("books-1163695_1").frame(width: UIScreen.main.nativeBounds.size.width, height: 0)
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 50).bold())
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


//func setupNavigationBar(){
//    let appearance = UINavigationBarAppearance()
//    appearance.configureWithTransparentBackground()
//    appearance.backgroundImage = UIImage(named:"books-1163695_1")
//
//}
