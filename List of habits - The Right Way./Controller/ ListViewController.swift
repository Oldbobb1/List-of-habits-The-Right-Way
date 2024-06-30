//  ViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    let  emojiCell = "EmojiTableViewCell", maxElements = 10
    var listView = ListView(), listModel = ListModel()
        
     override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewEmojiAdded(_:)), name: Notification.Name("NewEmojiAdded"), object: nil)
    }
    
    private func setupUI() {
        listView.updateUI(view)
        listView.updateCalendar()
        listModel.loadEmojiData()
        
        listView.table.delegate = self
        listView.table.dataSource = self
        listView.table.register(EmojiTableViewCell.self, forCellReuseIdentifier: "emojiCell")
        listView.table.frame = view.bounds
        
        listView.button.addTarget(self, action: #selector(buttonOpenView) , for: .touchUpInside)
    }
    
    @objc func buttonOpenView(_ sender: UIButton) {
        let habbitModel = HabbitModel(name: nil, time: nil, color: nil, isRepeated: false)
        let view  = HabbitViewController(habbitModel: habbitModel)
        let navController = UINavigationController(rootViewController: view)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func handleNewEmojiAdded(_ notification: Notification) {
        if listModel.objects.count < maxElements {
            if let newEmoji = notification.object as? Emoji {
                listModel.objects.append(newEmoji)
                let newIndexPath = IndexPath(row: listModel.objects.count - 1, section: 0)
                listView.table.insertRows(at: [newIndexPath], with: .automatic)
                listModel.saveEmojiData()
            }
        } else {
        }
    }
}

