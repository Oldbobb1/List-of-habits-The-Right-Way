//  CalendarVC.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import Foundation
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    let calendar = FSCalendar()
    var selectedDates = [Bool]()
    
    let button = ButtonsWithAction.createButtonWithdAction(setTitle: "close", cornerRadius: 40, content: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        calendar.delegate = self
        calendar.dataSource = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)

        view.addSubview(button)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)

        Layout.applyView(calendar, view: view, topOffset: 200, leadingOffset: 30, trailingOffset: -30, bottomOffset: -200)
        Layout.applyView(button, view: view, topOffset: 0, leadingOffset: 300, trailingOffset: -10)

        // Выделяем выбранные даты
        let calendar = Calendar.current
        for (index, selected) in selectedDates.enumerated() {
            if selected {
                let date = calendar.date(byAdding: .day, value: index - 2, to: Date())!
                self.calendar.select(date)
            }
        }
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let calendar = Calendar.current
        let dayIndex = calendar.component(.day, from: date) - 1
        
        if dayIndex >= 0 && dayIndex < selectedDates.count {
            selectedDates[dayIndex].toggle()

            // Обновляем отображение календаря
            if selectedDates[dayIndex] {
                // Выделяем дату в календаре
                self.calendar.select(date, scrollToDate: true)
            } else {
                // Снимаем выделение с даты в календаре
                self.calendar.deselect(date)
            }
        }
    }

    // Метод, который определяет количество событий для определенной даты
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let calendar = Calendar.current
        let dayIndex = calendar.component(.day, from: date) - 1
        
        if dayIndex >= 0 && dayIndex < selectedDates.count && selectedDates[dayIndex] {
            return 1 // Возвращаем 1, если дата выбрана
        }
        return 0 // Возвращаем 0, если дата не выбрана
    }
}
