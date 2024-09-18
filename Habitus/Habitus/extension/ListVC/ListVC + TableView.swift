import UIKit


extension ListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.habits.count
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
 
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 25
        maskLayer.borderWidth = 1
        maskLayer.borderColor = UIColor.black.cgColor
        maskLayer.backgroundColor = UIColor.black.cgColor
        
        let verticalPadding: CGFloat = 10
        let insetRect = cell.bounds.insetBy(dx: verticalPadding, dy: verticalPadding/2)
        maskLayer.frame = insetRect
        cell.layer.mask = maskLayer
        
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
        listView.descriptionLabel.isHidden = !listModel.habits.isEmpty
        listView.image.isHidden = !listModel.habits.isEmpty
        
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTrackerCell
//        let object = listModel.habits[indexPath.row]
////        cell.set(object: object)
//        cell.set(object: object , habitName: object.name)
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTrackerCell
        let object = listModel.habits[indexPath.row]
        // Настройка ячейки
        cell.set(object: object , habitName: object.name)
 
        // Обновляем интерфейс в зависимости от состояния привычки
        if object.isCompleted {
            cell.messageLabel.text = "Выполнено"
            cell.nameLabelCell.textColor = .systemGray6
            cell.contentView.backgroundColor = cell.contentView.backgroundColor?.withAlphaComponent(0.5)
        } else {
            cell.messageLabel.text = ""
            cell.nameLabelCell.textColor = .black
            cell.contentView.backgroundColor = cell.contentView.backgroundColor?.withAlphaComponent(1)
        }
        
        
        return cell
    }
      
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listModel.habits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            listModel.saveHabitData()
            toggleMessageLabelVisibility()
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let movedEmoji = listModel.habits.remove(at: sourceIndexPath.row)
//        listModel.habits.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}

extension ListVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? HabitTrackerCell else { return }
        
        let habit = listModel.habits[indexPath.row]  // Получаем привычку по индексу

        if !habit.isCompleted {
            // Первый алерт для подтверждения выполнения
            let firstAlertController = UIAlertController(title: "Уведомление", message: "mission complete?", preferredStyle: .alert)
            
            firstAlertController.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            
            firstAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in   //[weak self]
                guard let strongSelf = self else { return }
                
                // Обновляем интерфейс
                cell.messageLabel.text = "Выполнено"
                cell.nameLabelCell.textColor = .systemGray6
                cell.contentView.backgroundColor = cell.contentView.backgroundColor?.withAlphaComponent(0.5)
                cell.isCompleted = true
                
                // Обновляем данные привычки
                strongSelf.listModel.habits[indexPath.row].isCompleted = true
//                
//                // Сохраняем обновленные данные
                strongSelf.listModel.saveHabitData()
                
//                self.listModel.habits[indexPath.row].isCompleted = true
                
                // Сохраняем обновленные данные
//                self.listModel.saveHabitData()
            }))
            
            present(firstAlertController, animated: true, completion: nil)
            
        } else {
            // Второй алерт для отмены выполнения
            let cancelAlertController = UIAlertController(title: "Отмена", message: "Хотите отменить изменения?", preferredStyle: .alert)
            
            cancelAlertController.addAction(UIAlertAction(title: "Отменить", style: .destructive, handler: { [weak self] _ in
                guard let strongSelf = self else { return }
                
                // Восстанавливаем интерфейс
                cell.messageLabel.text = ""
                cell.nameLabelCell.textColor = .black
                cell.contentView.backgroundColor = cell.contentView.backgroundColor?.withAlphaComponent(1)
                cell.isCompleted = false
                
                // Обновляем данные привычки
                strongSelf.listModel.habits[indexPath.row].isCompleted = false
                
                // Сохраняем обновленные данные
                strongSelf.listModel.saveHabitData()
            }))
            
            cancelAlertController.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
            
            present(cancelAlertController, animated: true, completion: nil)
        }
    }
}








