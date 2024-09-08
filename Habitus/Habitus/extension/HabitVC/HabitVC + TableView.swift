import UIKit


extension HabitVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return CGFloat(cellHeights[indexPath.section])
//    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3:
            return 1
        default:
            return 0
        }
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellText = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
//            cellText.configure(text: nil, delegate: self, color: selectedColor) // Передача текста и цвета
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
//            let cellS = tableView.dequeueReusableCell(withIdentifier: "TexеCell", for: indexPath) as! TexеCell
//            cellS.selectionStyle = .none
//            cellS.backgroundColor = .clear
//            cellS.onColorViewTapped = { [weak self] in
//                     self?.showColorPicker()
//                 }
//            return cellS
            
            let cellS = tableView.dequeueReusableCell(withIdentifier: "TexеCell", for: indexPath) as! TexеCell
                   cellS.selectionStyle = .none
                   cellS.backgroundColor = .clear
                   cellS.onColorViewTapped = { [weak self] in
                       self?.selectedIndexPath = indexPath // Сохраняем индекс ячейки
                       self?.showColorPicker()
                   }
                   return cellS
    
        default:
            return UITableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        switch indexPath.section {
//        case 3:
//            let (_, _, _, action) = settingsItems[indexPath.row]
//            action?()
//        default:
//            break
//        }
//    }
}


extension HabitVC: UITableViewDelegate { }







