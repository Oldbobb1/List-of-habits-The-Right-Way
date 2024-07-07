//
//  File2.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit


class HabbitModel {
    
    
}

class HabbitView {

    
    func initializeUI(_ view: UIView) {
        
        
    }
    
    
}


class HabbitVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {

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
//          let isColorSelected = selectedColor != nil // Проверка, что цвет выбран
          button2.isEnabled = !nameText.isEmpty
//        && isColorSelected
      }
  
 func showColor() {
        let color  = UIColorPickerViewController()
        color.delegate = self
        present(color, animated: true, completion: nil)
    }
    
   

func showAlert() {
    let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertController, animated: true, completion: nil)
}

@objc func closeView() {
    self.dismiss(animated: true, completion: nil)
}

// MARK: - UITableViewDataSource

func numberOfSections(in tableView: UITableView) -> Int {
    return 7
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0, 1, 2:
        return 1
    case 3:
        return settingsItems.count
    default:
        return 0
    }
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! textCell
                cell.configure(text: nil, delegate: self, color: selectedColor) // Передача текста и цвета
             return cell
    case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateCell
        cell.configure(date: Date())
        return cell
    case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: "DaysCell", for: indexPath) as! DaysCell
        cell.selectionStyle = .none
        cell.configure(selectedDays: [])
        return cell
    case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let (imageName, title, hasSwitch, _) = settingsItems[indexPath.row]
        // Icon
        if let image = UIImage(systemName: imageName) {
            cell.imageView?.image = image
        } else if let customImage = UIImage(named: imageName) {
            cell.imageView?.image = customImage
        } else {
            cell.imageView?.image = UIImage(systemName: "questionmark.circle")
        }
        
        // Title
        cell.textLabel?.text = title
        cell.textLabel?.font = .systemFont(ofSize: 17)
        if title == "Color" {
            selectedColorView.backgroundColor = selectedColorView.backgroundColor ?? .clear
            cell.accessoryView = selectedColorView
            cell.selectionStyle = .default
        }
        // Accessory
       else if (hasSwitch) {
            let switchView = UISwitch(frame: .zero)
//                switchView.setOn(UserDefaults.standard.bool(forKey: "switchState"), animated: false)
            switchView.addTarget(self, action: #selector(switchSend(_:)), for: .valueChanged)
            cell.accessoryView = switchView
            cell.selectionStyle = .none  // Отключаем возможность нажатия на всю область
        } else {
            cell.accessoryType = .disclosureIndicator
            cell.accessoryView = nil
            cell.accessoryType = .none
            
        }
        return cell
    default:
        return UITableViewCell()
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    switch indexPath.section {
    case 3:
        let (_, _, _, action) = settingsItems[indexPath.row]
        action?()
    default:
        break
    }
}
}


extension HabbitVC: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        updateSaveButtonState()
    }
    
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        selectedColorView.backgroundColor = selectedColor
    }
    
}


extension HabbitVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



class DateCell: UITableViewCell {
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time // Установите нужный режим выбора времени или даты
        dp.preferredDatePickerStyle = .wheels // Опционально, стиль выбора колеса
        return dp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(datePicker)
    
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(date: Date?) {
        if let date = date {
            datePicker.date = date
        }
    }
}


class DaysCell: UITableViewCell {
    
    let daysModel = DaysModel() // Создание экземпляра DaysModel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Добавление кнопок дней недели
        daysModel.setupDaysOfWeek(contentView)
                              
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
//        contentView.layer.borderWidth = 1
        
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(selectedDays: [Int]) {
        daysModel.selectedDays = selectedDays
//        daysModel.updateButtonStates(in: contentView)
    }
}


class textCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
          
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}
