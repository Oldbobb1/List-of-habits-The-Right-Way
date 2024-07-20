import UIKit


extension ListVC {
    
    func updateDaysCalendar() {
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateAndWeekdayFormatter.dateCurrent(to: listView.calendarDateStackView, withDay: day)
        }
    }
    
    func toggleMessageLabelVisibility() {
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
    }
    
    func animateButtonScale(for button: UIButton, scaleFactor: CGFloat) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
    }
    
}
