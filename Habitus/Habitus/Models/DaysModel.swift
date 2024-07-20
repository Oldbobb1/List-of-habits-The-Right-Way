import UIKit
import ElementBuilder


class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView, userInterfaceStyle: UIUserInterfaceStyle) {
       
        for (index, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.makeButton(setTitle: day,cornerRadius: 18.5,content: .center, setTitleColor: .label,clipsToBounds: false, backgroundColor: .systemBackground)
            
//            dayButton.layer.shadowColor = UIColor.black.cgColor
//            dayButton.layer.shadowColor = (userInterfaceStyle == .dark) ? UIColor.white.cgColor : UIColor.black.cgColor
//
//            dayButton.layer.shadowOffset = CGSize(width: -1, height: 1)
//            dayButton.layer.shadowOpacity = 0.5
//            dayButton.layer.shadowRadius = 4
//            
            view.addSubview(dayButton)
            
            Layout.applyView(dayButton, view: view,topOffset: 1, leadingOffset: (CGFloat(0.5) + CGFloat(CGFloat(index) * CGFloat(44.5))),bottomOffset: -1 ,additionalConstraints: { make in
                make.width.equalTo(40)
                make.height.equalTo(40)
            })
            
            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
        
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }
        if index == 0 {
            if selectedDays.count == days.count - 1 {
                selectedDays.removeAll() // Сбросить выбор
            } else {
                selectedDays = Array(1..<days.count)
            }
        } else {
            if selectedDays.contains(index) {
                selectedDays.removeAll(where: { $0 == index })
            } else {
                selectedDays.append(index)
            }
        }
        for (index, day) in days.enumerated() {
            guard let button = sender.superview?.subviews.compactMap({ $0 as? UIButton }).first(where: { $0.titleLabel?.text == day }) else { continue }
            if selectedDays.contains(index) {
                button.backgroundColor = .systemBlue
            } else {
                button.backgroundColor = .systemBackground//.clear
            }
        }
    }
    
}






//class DaysModel {
//    
//    let days = ["All", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
//    var selectedDays = [Int]()
//    
//    func setupDaysOfWeek(_ view: UIView) {
//        for (index, day) in days.enumerated() {            
//            let dayButton = ButtonsWithAction.makeButton(setTitle: day,cornerRadius: 18.5,content: .center, setTitleColor: .label,clipsToBounds: false, backgroundColor: .secondarySystemBackground)
//            
//            dayButton.layer.shadowColor = UIColor.black.cgColor
//            dayButton.layer.shadowOffset = CGSize(width: -1, height: 1)
//            dayButton.layer.shadowOpacity = 0.5
//            dayButton.layer.shadowRadius = 4
//        
//            view.addSubview(dayButton)
//            
//        
//            Layout.applyView(dayButton, view: view, topOffset: 1, leadingOffset: (CGFloat(0.5) + CGFloat(CGFloat(index) * CGFloat(44.5))), bottomOffset: -1, additionalConstraints: { make in
//                make.width.equalTo(40)
//                make.height.equalTo(40)
//            })
//            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
//        }
//    }
//    
//    @objc func dayButtonTapped(sender: UIButton) {
//        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }
//        
//        // Вывод в консоль выбранного дня
//        print("Selected day: \(days[index])")
//        
//        if index == 0 {
//            if selectedDays.count == days.count - 1 {
//                selectedDays.removeAll() // Сбросить выбор
//            } else {
//                selectedDays = Array(1..<days.count)
//            }
//        } else {
//            if selectedDays.contains(index) {
//                selectedDays.removeAll(where: { $0 == index })
//            } else {
//                selectedDays.append(index)
//            }
//        }
//        updateButtonColors(sender: sender)
//        
//        // Привязка к календарю
//        if selectedDays.count > 0 {
//            let selectedDates = getDatesForSelectedDays()
//            print(selectedDates)
//        }
//    }
//    
//    private func updateButtonColors(sender: UIButton) {
//        for (index, day) in days.enumerated() {
//            guard let button = sender.superview?.subviews.compactMap({ $0 as? UIButton }).first(where: { $0.titleLabel?.text == day }) else { continue }
//            if selectedDays.contains(index) {
//                button.backgroundColor = .systemBlue
//            } else {
//                button.backgroundColor = .secondarySystemBackground
//            }
//        }
//    }
//    
//    // Метод для получения всех дат выбранных дней недели
//    func getDatesForSelectedDays() -> [Date] {
//        var dates = [Date]()
//        let calendar = Calendar.current
//        let today = Date()
//        
//        // Получить все дни на ближайший месяц (или год, если хотите)
//        let range = calendar.range(of: .day, in: .era, for: today)!
//
//        for dayOffset in range {
//            if let date = calendar.date(byAdding: .day, value: dayOffset, to: today) {
//                let weekday = calendar.component(.weekday, from: date)
//                if selectedDays.contains(weekday) {
//                    dates.append(date)
//                }
//            }
//        }
//        return dates
//    }
//}
