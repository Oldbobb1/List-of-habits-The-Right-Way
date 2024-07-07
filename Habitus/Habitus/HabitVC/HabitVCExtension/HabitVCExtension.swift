//
//  HabitVCExtension.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit

extension HabitVC: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        updateSaveButtonState()
    }
    
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        selectedColorView.backgroundColor = selectedColor
    }
    
}


extension HabitVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension HabitVC: UITableViewDataSource {
    
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

extension HabitVC: UITableViewDelegate {
    
    
}
