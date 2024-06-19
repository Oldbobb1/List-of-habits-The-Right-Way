//  ViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    let  emojiCell = "EmojiTableViewCell"
    let  maxElements = 10
    
    var list: ListModel!
    
    var table = UITableView(); var stackView = UIStackView(); var button = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ListModel(); list.updateUI(view: self.view); list.updateCalendar(); list.loadEmojiData()
        
        table = list.table
        stackView = list.stackView
        button = list.button
        
        setupUI(); buttonAction()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewEmojiAdded(_:)), name: Notification.Name("NewEmojiAdded"), object: nil)
    }
    
    private func setupUI() {
        table.delegate = self
        table.dataSource = self
        table.register(EmojiTableViewCell.self, forCellReuseIdentifier: "emojiCell")
        table.frame = view.bounds
        //        table.backgroundColor = .systemGray4
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


extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // Установить высоту ячейки
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.objects.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10
        
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 30 //if you want round edges
        maskLayer.borderWidth = 1
        maskLayer.borderColor = UIColor.black.cgColor
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        let object = list.objects[indexPath.row]
        cell.set(object: object)
        cell.backgroundColor = .systemGray4
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            list.saveEmojiData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = list.objects.remove(at: sourceIndexPath.row)
        list.objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}


extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell \(indexPath.row)")
    }
}
