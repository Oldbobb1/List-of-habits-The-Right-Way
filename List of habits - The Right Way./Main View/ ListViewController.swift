//  ViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import SnapKit


class ListViewController: UIViewController {
    
    
    let label = Label.label(text: "List", fontSize: 25)
    let stackView = StackView.stack()
    let table = TableView.createNewTableView()
    let button = ButtonsWithAction.addButtonImage(systemName: "plus.circle", setImage: nil )
    
    let  emojiCell = "EmojiTableViewCell"

    var objects = [ Emoji]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        updateCalendar()
        
        setupUI()
        
        buttonAction()
        
     NotificationCenter.default.addObserver(self, selector: #selector(handleNewEmojiAdded(_:)), name: Notification.Name("NewEmojiAdded"), object: nil)
        
       }
    
    @objc func handleNewEmojiAdded(_ notification: Notification) {
        if let newEmoji = notification.object as? Emoji {
            objects.append(newEmoji)
            let newIndexPath = IndexPath(row: objects.count - 1, section: 0)
            table.insertRows(at: [newIndexPath], with: .automatic)
          
        }
    }

    func updateCalendar() {
        
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateCurrent(to: stackView, withDay: day)
        }
    }
    
    
    private func updateUI() {
        
        view.addSubview(label)
        view.addSubview(stackView)
        view.addSubview(table)
        view.addSubview(button)
        self.table.addSubview(button)
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0 )
        
        Layout.applyView(stackView, view: view , leadingOffset: 270, trailingOffset: 0,  additionalConstraints: {make in
            make.top.equalTo(self.label.snp.bottom).offset(0)
            make.height.equalTo(38)
        })
        Layout.applyView(table, view: view, leadingOffset: 10 , trailingOffset: -10, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.stackView.snp.bottom).offset(5)
        })
        
        Layout.applyView(button, view: view, leadingOffset: 15 , bottomOffset: -10)
    }
    
    private func setupUI() {
        
        table.delegate = self
        table.dataSource = self
        table.register(EmojiTableViewCell.self, forCellReuseIdentifier: "emojiCell")
        table.frame = view.bounds
        table.backgroundColor = .systemGray4
//        table.contentInset.bottom = CGFloat(- verticalPadding / 2)
//        table.contentInset.top = CGFloat(-verticalPadding / 2)
    
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
        return objects.count
     
    }
        
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
//
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
//        let object = objects[indexPath.row]
        let object = objects[indexPath.section]
        cell.set(object: object)
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
   func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
 func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
 func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}



extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell \(indexPath.row)")
    }
}






