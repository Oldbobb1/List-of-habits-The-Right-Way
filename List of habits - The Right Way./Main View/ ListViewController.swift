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
   
    let  NewLocationIdentifier = "NewLocation"
    
    let models: [NewsWithLocationModel] = [
        NewsWithLocationModel(
            name: "Habbit"
        ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(label)
        view.addSubview(stackView)
        view.addSubview(table)
        view.addSubview(button)
        self.table.addSubview(button)

        table.delegate = self
        table.dataSource = self
        table.register(NewLocation.self, forCellReuseIdentifier: "NewLocationIdentifier")
        table.frame = view.bounds

        button.addTarget(self, action: #selector(buttonOpenView) , for: .touchUpInside)
            
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0 )
        
        Layout.applyView(stackView, view: view , leadingOffset: 270, trailingOffset: 0,  additionalConstraints: {make in
            make.top.equalTo(self.label.snp.bottom).offset(0)
            make.height.equalTo(38)
        })
        Layout.applyView(table, view: view, leadingOffset: 10 , trailingOffset: -10, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.stackView.snp.bottom).offset(5)
        })
        
        Layout.applyView(button, view: view, leadingOffset: 15 , bottomOffset: -10)
        
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateCurrent(to: stackView, withDay: day)
        }
    }
    
    @objc func buttonOpenView(_ sender: UIButton) {
        let view  = HabbitViewController()
        let navController = UINavigationController(rootViewController: view)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
}


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewLocationIdentifier", for: indexPath)
        let models = models[indexPath.row]
        cell.textLabel?.text = models.name
        //        cell.backgroundColor = .yellow
        cell.backgroundColor = .green
                cell.layer.cornerRadius = 30
                cell.layer.borderWidth = 1
        return cell
    }
}


extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell \(indexPath.row)")
    }
}
