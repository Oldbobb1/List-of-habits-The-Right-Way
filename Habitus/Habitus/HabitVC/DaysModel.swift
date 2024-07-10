//  DaysModel.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView) {
        for (index, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.createButtonWithdAction(setTitle: day, cornerRadius: 10, content: .center)
            view.addSubview(dayButton)
            
            Layout.applyView(dayButton, view: view,topOffset: 1, leadingOffset: (CGFloat(0.5) + CGFloat(index * 45)),bottomOffset: -1 ,additionalConstraints: { make in
                make.width.equalTo(37)
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
                button.backgroundColor = .clear
            }
        }
    }
}
