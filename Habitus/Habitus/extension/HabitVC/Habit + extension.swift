import UIKit
import ElementBuilder


extension HabitVC {

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
    

    @objc func saveHabitAdnSendButtonTapped() {
        let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell
        let habitName = textCell?.textField.text
        let isColorSelected = selectedColor != nil
        let selectedTime = self.selectedTime
        
        print("Habit Name: \(habitName ?? "nil")")
        print("Selected Color: \(selectedColor?.description ?? "nil")")
//        print("Selected Time: \(selectedTime ?? "nil")")

        guard let habitName = habitName, !habitName.isEmpty, isColorSelected, let selectedTime = selectedTime else {
            print("Invalid data, cannot save habit")
            return
        }

        let newHabit = HabitEntry(name: habitName, color: selectedColor ?? .gray, reminderTime: selectedTime)
        
        // Отправляем уведомление о добавлении новой привычки
        NotificationCenter.default.post(name: Notification.Name("NewHabitAdded"), object: newHabit)
        
        // Планируем уведомление
        scheduleNotification(for: selectedTime, habitName: habitName)

        // Закрываем экран после сохранения
        self.dismiss(animated: true, completion: nil)
    }

//MARK: -
//    @objc func saveHabitAdnSendButtonTapped() {
//        // Проверяем, правильно ли получены данные
//        let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell
//        let habitName = textCell?.textField.text
//        let isColorSelected = selectedColor
//        let selectedTime = self.selectedTime
//
//        print("Habit Name: \(habitName ?? "nil")")
//        print("Selected Color: \(selectedColor?.description ?? "nil")")
////        print("Selected Time: \(selectedTime ?? "nil")")
//
//        // Убедитесь, что все данные валидны
//        guard let habitName = habitName, !habitName.isEmpty, (isColorSelected != nil), let selectedTime = selectedTime else {
//            print("Invalid data, cannot save habit")
//            return
//        }
//
//        let newHabit = HabitEntry(name: habitName, color: selectedColor ?? .color1, reminderTime: selectedTime)
//        
//        // Отправляем уведомление о добавлении новой привычки
//        NotificationCenter.default.post(name: Notification.Name("NewHabitAdded"), object: newHabit)
//
//        print("New habit added: \(newHabit)")
//
//        // Закрываем экран после сохранения
//        self.dismiss(animated: true, completion: nil)
//    }
//MARK: - вернуть после
    func updateHabitSaveButtonState() {
        let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell
        let nameText = textCell?.textField.text ?? ""
        let isColorSelected = selectedColor != nil
        
        // Проверяем, установлено ли время
        let isTimeSelected = selectedTime != nil

        // Лог для проверки условий
        print("Name: \(nameText.isEmpty ? "empty" : nameText)")
        print("Color selected: \(isColorSelected)")
        print("Time selected: \(isTimeSelected)")

        // Кнопка активна только если введен текст, выбран цвет и установлено время
        habitView.buttonSaveAndSendInTable.isEnabled = !nameText.isEmpty && isColorSelected && isTimeSelected
        
        // Отладка кнопки
        print("Button enabled: \(habitView.buttonSaveAndSendInTable.isEnabled)")
    }
    
    
//    @objc func saveHabitAdnSendButtonTapped() {
//        guard let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell,
//              let habitName = textCell.textField.text,
//              let selectedColor = selectedColor else { return }
//        let newHabit = HabitEntry(name: habitName, color: selectedColor )
//        updateHabitSaveButtonState()
//        NotificationCenter.default.post(name: Notification.Name("NewHabitAdded"), object: newHabit)
//        self.dismiss(animated: true, completion: nil)
//    }
//    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateHabitSaveButtonState()
    }
    
//    func updateHabitSaveButtonState() {
//            let textCell = habitView.createTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell
//            let nameText = textCell?.textField.text ?? ""
//            let isColorSelected = selectedColor != nil // Проверка, что цвет выбран
//        habitView.buttonSaveAndSendInTable.isEnabled = !nameText.isEmpty && isColorSelected
//    }
    
    func showColorPicker() {
        let color  = UIColorPickerViewController()
        color.delegate = self
        present(color, animated: true, completion: nil)
    }
    
    @objc func closeHabitVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func scheduleNotification(for date: Date, habitName: String) {
        let content = UNMutableNotificationContent()
        content.title = "Habit Reminder"
        content.body = "It's time to work on: \(habitName)"
        content.sound = .default
        
        // Настраиваем время уведомления
        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        // Создаем запрос уведомления
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Добавляем запрос в центр уведомлений
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled for \(date)")
            }
        }
    }
    
    
}












