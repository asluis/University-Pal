//
//  ChatListViewController.swift
//  University Pal
//
//  Created by 矢野敦也 on 2021/10/10.
//

//import UIKit
//
//class ChatListViewController: UIViewController{
//    
//    private let cellId = "cellId"
//    
//    @IBOutlet weak var chatListTableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        chatListTableView.delegate = self
//        chatListTableView.dataSource = self
//    }
//}
//
//// MARK: -UITableViewDelegate, UITableViewDataSource
//extension ChatListViewController:UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        
//        return cell
//    }
//    
//    
//}
//                                        
//
//class ChatListTableViewCell: UITableViewCell{
//    
//    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var partnerLabel: UILabel!
//    @IBOutlet weak var latestMessageLabel: UILabel!
//    @IBOutlet weak var userImageView: UIImageView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        userImageView.layer.cornerRadius = 35
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//}
