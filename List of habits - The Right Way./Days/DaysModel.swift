//  DaysModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 24.06.24.

import UIKit

class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView, traitCollection: UITraitCollection) {
        for (index, day) in days.enumerated() {
            let dayButton = UIButton()
            dayButton.setTitle(day, for: .normal)
            dayButton.contentHorizontalAlignment = .center // Выравнивание текста по центру
            dayButton.layer.cornerRadius = 10
            dayButton.layer.borderWidth = 1
//            dayButton.layer.borderColor = UIColor.red.cgColor
            
            if traitCollection.userInterfaceStyle == .dark {
                dayButton.setTitleColor(.label, for: .normal)
            } else {
                dayButton.setTitleColor(.label, for: .normal)
            }
            view.addSubview(dayButton)
            
            dayButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(495)
                make.leading.equalToSuperview().offset(10 + index * 48) //49
                make.width.equalTo(38) // Устанавливаем фиксированную ширину
                make.height.equalTo(40)
            }
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
