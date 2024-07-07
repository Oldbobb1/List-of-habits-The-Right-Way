//
//  File2.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit


class HabitVC: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    let titleLabel = Label.label(text: "New Habit", fontSize: 25, weight: .bold, textColor: nil)
    let button1 = ButtonsWithAction.addButtonWithAction(setTitle: "Cancel")
    let button2 = ButtonsWithAction.addButtonWithAction(setTitle: "Save")
    
    var isUserLoggedIn = false
    var userName: String = ""
    var userImage: UIImage?
    
    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
    var accountItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
    
    
    
    let  selectedColorView: UIView = {
        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()
    
    var swipe: SwipeClass?
    
    var selectedColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        settingsItems = [
            ("paintbrush", "Color", false, { self.showColor()}),
            ("repeat.circle", "Signal repeat", true, nil),
        ]
        
        view.addSubview(selectedColorView)
        
        view.addSubview(titleLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        button1.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        button2.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button2.isEnabled = false
        
        // Table View
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .secondarySystemBackground
        
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(textCell.self, forCellReuseIdentifier: "textCell")
        tableView.register(DateCell.self, forCellReuseIdentifier: "DateCell")
        tableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button1, view: view, topOffset: 0.99, leadingOffset: 0.5, trailingOffset: -285)
        Layout.applyView(button2, view: view, topOffset: 0.99, leadingOffset: 285, trailingOffset: -0.5)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        swipeActions()
    }
    
    func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction:{},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    @objc func switchSend( _ sender: UISwitch){
        //        if sender.isOn {
        //
        //        } else {
        //
        //        }
        
    }
    
    @objc func saveButtonTapped() {
        guard let textCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? textCell,
              let habitName = textCell.textField.text, let selectedColor = selectedColor else { return }
        let newHabit = HabitEntry(name: habitName, color: selectedColor)
        updateSaveButtonState()
        NotificationCenter.default.post(name: Notification.Name("NewHabitAdded"), object: newHabit)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let textCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? textCell
        let nameText = textCell?.textField.text ?? ""
        let isColorSelected = selectedColor != nil // Проверка, что цвет выбран
        button2.isEnabled = !nameText.isEmpty && isColorSelected
    }
    
    func showColor() {
        let color  = UIColorPickerViewController()
        color.delegate = self
        present(color, animated: true, completion: nil)
    }

    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
}






