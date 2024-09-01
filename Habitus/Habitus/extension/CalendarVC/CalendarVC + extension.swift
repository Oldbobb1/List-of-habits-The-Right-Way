import UIKit
import FSCalendar

extension CalendarViewController: FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return selectedDates.contains(date) ? 1 : 0
    }
}


extension CalendarViewController: FSCalendarDelegate {
    
    func showAlert(for date: Date, isSelected: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: date)
        
        let alert = UIAlertController(title: "Выбор даты",
                                      message: isSelected ? "Удалить дату \(dateString)?" : "Выбрать дату \(dateString)?",
                                      preferredStyle: .alert)
        
        let actionTitle = isSelected ? "Удалить" : "Выбрать"
        let action = UIAlertAction(title: actionTitle, style: .default) { _ in
            if isSelected {
                self.selectedDates.removeAll { $0 == date }
            } else {
                self.selectedDates.append(date)
            }
            self.saveSelectedDates()
            self.calendar.reloadData() // Update the calendar view
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.deselect(date) // Deselect to manage selection manually
        if selectedDates.contains(date) {
            showAlert(for: date, isSelected: true)
        } else {
            showAlert(for: date, isSelected: false)
        }
    }
}


extension CalendarViewController: FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        return selectedDates.contains(date) ? .systemBlue : nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        return selectedDates.contains(date) ? .white : .black
    }
}
