import UIKit


extension HabitVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 // Укажите нужную высоту отступа
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear // Прозрачный фон
        return headerView
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellText = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
//            cellText.configure(text: nil, delegate: self, color: selectedColor) // Передача текста и цвета
            cellText.backgroundColor = .clear
            cellText.selectionStyle = .none
            cellText.textField.delegate = self
                 return cellText
        case 1:
//            let cellDate = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerCell
//            cellDate.configure(date: Date())
//            cellDate.backgroundColor = .clear
//            cellDate.selectionStyle = .none
//            cellDate.onTimeSelected = { [weak self] selectedTime in
//                self?.updateHabitSaveButtonState()
//            }
//            return cellDate
            let cellDate = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerCell
                   cellDate.configure(date: nil)  // Лучше передавать nil, чтобы пользователь сам выбрал время
                   cellDate.backgroundColor = .clear
                   cellDate.selectionStyle = .none

                   // Устанавливаем замыкание для получения выбранного времени
                   cellDate.onTimeSelected = { [weak self] selectedTime in
                       print("Selected time: \(selectedTime)")
                       // Отладочный вывод времени
                       self?.selectedTime = selectedTime   
                       self?.updateHabitSaveButtonState()
                   }
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







