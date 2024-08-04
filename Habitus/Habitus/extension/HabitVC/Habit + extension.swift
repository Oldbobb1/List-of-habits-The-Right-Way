import UIKit
import ElementBuilder


extension HabitVC {
    
//    func swipeActions() {
//        swipe = SwipeClass(viewController: self,
//                           leftAction:{},
//                           rightAction: {[weak self] in
//            guard let self = self else {return}
//            self.dismiss(animated: true, completion: nil)
//        })
//    }
    
    @objc func switchSend( _ sender: UISwitch){
        //        if sender.isOn {
        //
        //        } else {
        //
        //        }
        
    }
    
    @objc func saveHabitAdnSendButtonTapped() {
        guard let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell,
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
        let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell
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
