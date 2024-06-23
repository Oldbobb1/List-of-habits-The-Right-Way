//  ViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    let  emojiCell = "EmojiTableViewCell", maxElements = 10
    var list: ListModel!; var table = UITableView(); var stackView = UIStackView(); var button = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ListModel()
        list.updateUI(view: self.view)
        list.updateCalendar()
        list.loadEmojiData()
        
        table = list.table
        stackView = list.stackView
        button = list.button
        
        setupUI()
        buttonAction()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewEmojiAdded(_:)), name: Notification.Name("NewEmojiAdded"), object: nil)
    }
    
    private func setupUI() {
        table.delegate = self
        table.dataSource = self
        table.register(EmojiTableViewCell.self, forCellReuseIdentifier: "emojiCell")
        table.frame = view.bounds
    }
    
    private func buttonAction() {
        button.addTarget(self, action: #selector(buttonOpenView) , for: .touchUpInside)
    }
    
    @objc func buttonOpenView(_ sender: UIButton) {
        let view  = HabbitViewController()
        let navController = UINavigationController(rootViewController: view)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func handleNewEmojiAdded(_ notification: Notification) {
        if list.objects.count < maxElements {
            if let newEmoji = notification.object as? Emoji {
                list.objects.append(newEmoji)
                let newIndexPath = IndexPath(row: list.objects.count - 1, section: 0)
                table.insertRows(at: [newIndexPath], with: .automatic)
                list.saveEmojiData()
            }
        } else {
        }
    }
}

