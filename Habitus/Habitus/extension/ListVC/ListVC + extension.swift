import UIKit


extension ListVC {
    
//    func updateDaysCalendar() {
//        let calendar = Calendar.current
//        for i in -2..<1 {
//            let day = calendar.date(byAdding: .day, value: i, to: Date())!
//            dateAndWeekdayFormatter.dateCurrent(to: listView.calendarDateStackView, withDay: day)
//        }
//    }
    
    func toggleMessageLabelVisibility() {
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
        listView.descriptionLabel.isHidden = !listModel.habits.isEmpty
        listView.image.isHidden = !listModel.habits.isEmpty
    }
}
