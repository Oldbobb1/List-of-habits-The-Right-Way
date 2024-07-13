//  DaysModel.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit
import ElementBuilder

class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView) {
        for (index, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.createButtonWithAction(setTitle: day, cornerRadius: 18.5, content: .center)
            
//            let dayButton = UIButton()
//            dayButton.setTitle(day, for: .normal)
//            dayButton.setTitleColor(.label, for: .normal)
//            dayButton.layer.cornerRadius = 18.5
//                     dayButton.layer.shadowColor = UIColor.blue.cgColor
//                     dayButton.layer.shadowOffset = CGSize(width: 1, height: 4)
//            dayButton.layer.shadowOpacity = 1
//            dayButton.layer.shadowRadius = 2
//            dayButton.backgroundColor = .systemGray6
            
        
            
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
                button.backgroundColor = .clear //.clear
            }
        }
    }
}


