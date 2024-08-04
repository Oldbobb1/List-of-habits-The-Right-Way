import UIKit


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
            let cellText = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            cellText.configure(text: nil, delegate: self, color: selectedColor) // Передача текста и цвета
            cellText.backgroundColor = .clear
                 return cellText
        case 1:
            let cellDate = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerCell
            cellDate.configure(date: Date())
            cellDate.backgroundColor = .clear
            return cellDate
        case 2:
            let cellDays = tableView.dequeueReusableCell(withIdentifier: "DaysCell", for: indexPath) as! DaysCell
            cellDays.selectionStyle = .none
            cellDays.configure(selectedDays: [])
            cellDays.backgroundColor = .clear
            return cellDays
        case 3:
            let cellS = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let (imageName, title, hasSwitch, _) = settingsItems[indexPath.row]
            // Icon

            if let image = UIImage(systemName: imageName) {
                cellS.imageView?.image = image
                
                cellS.imageView?.tintColor = .red

            } else if let customImage = UIImage(named: imageName) {
                cellS.imageView?.image = customImage
            } else {
                cellS.imageView?.image = UIImage(systemName: "questionmark.circle")
            }
            // Title
            cellS.textLabel?.text = title
            cellS.textLabel?.font = .systemFont(ofSize: 17)
     
            if title == "Color" {
                habitView.selectedColorView.backgroundColor = habitView.selectedColorView.backgroundColor ?? .clear
                cellS.accessoryView = habitView.selectedColorView
                
                habitView.selectedColorView.layer.cornerRadius = 15
                habitView.selectedColorView.layer.shadowColor = UIColor.black.cgColor
                habitView.selectedColorView.layer.shadowOffset = CGSize(width: 0, height: 2)
                habitView.selectedColorView.layer.shadowOpacity = 0.2
                habitView.selectedColorView.layer.shadowRadius = 4
                
                cellS.selectionStyle = .default
            }
            // Accessory
           else if (hasSwitch) {
                let switchView = UISwitch(frame: .zero)
    //                switchView.setOn(UserDefaults.standard.bool(forKey: "switchState"), animated: false)
                switchView.addTarget(self, action: #selector(switchSend(_:)), for: .valueChanged)
               cellS.accessoryView = switchView
               cellS.selectionStyle = .none
               
            } else {
                cellS.accessoryType = .disclosureIndicator
                cellS.accessoryView = nil
                cellS.accessoryType = .none
            }
            cellS.backgroundColor = .clear
            
            return cellS
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


extension HabitVC: UITableViewDelegate { }
