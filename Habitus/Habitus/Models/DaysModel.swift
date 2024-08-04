import UIKit
import ElementBuilder


class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView, userInterfaceStyle: UIUserInterfaceStyle) {
        for (index, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.makeButton(setTitle: day,cornerRadius: 10,content: .center, setTitleColor: .systemGray,clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
        
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
                button.backgroundColor = .systemGray6//.clear
            }
        }
    }
}
