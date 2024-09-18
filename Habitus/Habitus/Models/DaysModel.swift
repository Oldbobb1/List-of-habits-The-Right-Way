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
//        stackView.backgroundColor = .red
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6) // Отступы от границ stackView


        view.addSubview(stackView)

        Layout.applyView(stackView, view: view,topOffset: 1, leadingOffset: 1, trailingOffset: -1, bottomOffset: -1, additionalConstraints: { make in
            make.height.equalTo(50)
        })
        
        for (_, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.makeButton(setTitle: day,cornerRadius: 10,content: .center,setTitleColor:UIColor(named: "daysModelTextColor"),clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.8,shadowRadius: 4)
        
//            view.addSubview(dayButton)
            
            stackView.addArrangedSubview(dayButton)
 

            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }

        if index ==  0  {
            if  selectedDays.count == days.count - 1 {
                selectedDays.removeAll()
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
                button.layer.shadowColor = UIColor.systemBlue.cgColor
                
            } else {
                button.backgroundColor = .systemGray6
                button.layer.shadowColor = UIColor.gray.cgColor
            }
        }
    }
}








