//  HabitVC.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class HabitVC: UIViewController {
    
    let habitView = HabitViewUI()
    var swipe: SwipeClass?, selectedColor: UIColor?
    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        habitView.initializeUI(view)
    
        swipeActions(); configureSettingsItems(); configureUI()
    }
    
    func configureSettingsItems() {
        settingsItems = [
            ("paintbrush", "Color", false, { self.showColorPicker()}),
            ("repeat.circle", "Signal repeat", true, nil),
        ]
    }
    
    func configureUI() {
        
        habitView.tableView.dataSource = self
        habitView.tableView.delegate = self
        
        habitView.buttonCloseUIView.addTarget(self, action: #selector(closeHabitVC), for: .touchUpInside)
        habitView.buttonSaveAndSendInTable.addTarget(self, action: #selector(saveHabitButtonTapped), for: .touchUpInside)
        habitView.buttonSaveAndSendInTable.isEnabled = false
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
    
    @objc func saveHabitButtonTapped() {
        guard let textCell = habitView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell,
              let habitName = textCell.textField.text, let selectedColor = selectedColor else { return }
        let newHabit = HabitEntry(name: habitName, color: selectedColor)
        updateHabitSaveButtonState()
        NotificationCenter.default.post(name: Notification.Name("NewHabitAdded"), object: newHabit)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateHabitSaveButtonState()
    }
    
    func updateHabitSaveButtonState() {
        let textCell = habitView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell
        let nameText = textCell?.textField.text ?? ""
        let isColorSelected = selectedColor != nil // Проверка, что цвет выбран
        habitView.buttonSaveAndSendInTable.isEnabled = !nameText.isEmpty && isColorSelected
    }
    
    func showColorPicker() {
        let color  = UIColorPickerViewController()
        color.delegate = self
        present(color, animated: true, completion: nil)
    }

    @objc func closeHabitVC() {
        self.dismiss(animated: true, completion: nil)
    }
}






