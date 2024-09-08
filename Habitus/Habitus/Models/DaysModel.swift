import UIKit
import ElementBuilder


class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView, userInterfaceStyle: UIUserInterfaceStyle) {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually // Равномерное распределение кнопок
        stackView.spacing = 5 // Отступы между кнопками

        view.addSubview(stackView)
        
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1).isActive = true
//        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
        Layout.applyView(stackView, view: view,topOffset: 1, leadingOffset: 1 , trailingOffset: -1 , bottomOffset: -1, additionalConstraints: { make in
            make.height.equalTo(40)
        })


        for (_, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.makeButton(setTitle: day,cornerRadius: 10,content: .center, setTitleColor: .systemGray,clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.6,shadowRadius: 4)
        
//            view.addSubview(dayButton)
            
            stackView.addArrangedSubview(dayButton)
       
//            Layout.applyView(dayButton, view: view,topOffset: 1, leadingOffset: (CGFloat(0.5) + CGFloat(CGFloat(index) * CGFloat(44.5))),bottomOffset: -1 ,additionalConstraints: { make in
//                make.width.equalTo(40)
//                make.height.equalTo(40)
//            })
            
//            let screenWidth = UIScreen.main.bounds.width
//            let buttonWidth = screenWidth / 8.99  // Пример: делим экран на 8 частей для кнопок
//
//            Layout.applyView(dayButton, view: view, topOffset: 1, leadingOffset: (CGFloat(1) + CGFloat(CGFloat(index) * buttonWidth)), bottomOffset: -1, additionalConstraints: { make in
//                make.width.equalTo(buttonWidth - -1)  // Примерное выравнивание с учетом отступов
//                make.height.equalTo(buttonWidth - -1)  // Примерная высота равная ширине
//            })
            
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
                button.backgroundColor = .systemGray6//.clear
            }
        }
    }
}





//class DaysModel {
//
//    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
//    var selectedDays = [Int]()
//    
//    func setupDaysOfWeek(_ view: UIView, userInterfaceStyle: UIUserInterfaceStyle) {
//        // Создаем UIStackView
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually // Равномерное распределение кнопок
//        stackView.spacing = 1 // Отступы между кнопками
//        
//        view.addSubview(stackView)
//        
//        // Устанавливаем авто-ограничения для stackView
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1).isActive = true
//        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        
//        // Добавляем кнопки в stackView
//        for (_, day) in days.enumerated() {
//            let dayButton = ButtonsWithAction.makeButton(setTitle: day, cornerRadius: 10, content: .center, setTitleColor: .systemGray, clipsToBounds: false, backgroundColor: .systemGray6, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.2, shadowRadius: 4)
//            
//            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
//            stackView.addArrangedSubview(dayButton) // Добавляем кнопку в stackView
//        }
//    }
//    
//    @objc func dayButtonTapped(sender: UIButton) {
//        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }
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
//        for (index, day) in days.enumerated() {
//            guard let button = sender.superview?.subviews.compactMap({ $0 as? UIButton }).first(where: { $0.titleLabel?.text == day }) else { continue }
//            if selectedDays.contains(index) {
//                button.backgroundColor = .systemBlue
//            } else {
//                button.backgroundColor = .systemGray6
//            }
//        }
//    }
//}
