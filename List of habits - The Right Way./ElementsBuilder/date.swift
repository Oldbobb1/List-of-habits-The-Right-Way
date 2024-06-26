//  Date.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

//MARK: - укороченная версия добавления календаря

func dateCurrent(to stackView: UIStackView, withDay day: Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EE"
    let calendar = Calendar.current
    let dayOfWeek = dateFormatter.string(from: day)
    let dayOfMonth = calendar.component(.day, from: day)
    let dayOfWeekLabel = UILabel()
    dayOfWeekLabel.text = "\(dayOfWeek)\n\(dayOfMonth)"
    dayOfWeekLabel.numberOfLines = 0
    dayOfWeekLabel.font = UIFont.systemFont(ofSize: 13)
    
    stackView.addArrangedSubview(dayOfWeekLabel)
}

//MARK: - использование в модели или непоследственно в классе (в классе вызов во viewDidload).

//func calendar() {
//    let calendar = Calendar.current
//    
//    for i in 0..<3 {
//        let date = calendar.date(byAdding: .day, value: i, to: Date())!
//        dateCurrent(to: stackView, withDay: day)
//    }
//}

