import SwiftUI
import UIKit
import ElementBuilder


class HabitVC: UIViewController {
    
    let habitView = HabitUI()
    let habitModel = HabitModel()
    
    var swipe: SwipeClass?
    var selectedColor: UIColor?
    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
                
        habitView.initializeUI(view)
    
        swipeActions(); configureSettingsItems(); configureUI()
        
       themeUpdate()
    }
    
    func configureSettingsItems() {
        settingsItems = [
            ("paintbrush", "Color", false, { self.showColorPicker()}),
            ("repeat.circle", "Signal repeat", true, nil),
        ]
    }
        
    func configureUI() {
        habitView.createTableView.dataSource = self
        habitView.createTableView.delegate = self
        
        habitView.buttonCloseUIView.addTarget(self, action: #selector(closeHabitVC), for: .touchUpInside)
        habitView.buttonSaveAndSendInTable.addTarget(self, action: #selector(saveHabitAdnSendButtonTapped), for: .touchUpInside)
        habitView.buttonSaveAndSendInTable.isEnabled = false
    }
        
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




struct ViewControllerProvider4: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            HabitVC()
        }.edgesIgnoringSafeArea(.all)
    }
}



extension HabitVC {
    
    func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction:{},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func themeUpdate() {
        
        if traitCollection.userInterfaceStyle == .dark {
            //            view.backgroundColor = .red
            // Настройка элементов для темной темы
            habitView.buttonCloseUIView.layer.shadowColor = UIColor.white.cgColor
            //            habitView.buttonCloseUIView.backgroundColor = .lightGray
            habitView.buttonSaveAndSendInTable.layer.shadowColor = UIColor.white.cgColor
            habitView.titleLabel.layer.shadowColor = UIColor.white.cgColor
            // ...
        } else {
            view.backgroundColor = .systemBackground
            // Настройка элементов для светлой темы
            habitView.buttonCloseUIView.layer.shadowColor = UIColor.black.cgColor
            habitView.buttonSaveAndSendInTable.layer.shadowColor = UIColor.black.cgColor
            habitView.titleLabel.layer.shadowColor = UIColor.black.cgColor
            // ...
        }
    }
    
}
