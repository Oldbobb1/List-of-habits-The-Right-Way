//  DatePickerCell.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit
import SnapKit

class DatePickerCell: UITableViewCell {
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time // Установите нужный режим выбора времени или даты
        dp.preferredDatePickerStyle = .wheels // Опционально, стиль выбора колеса
//        dp.layer.shadowColor = UIColor.black.cgColor
//        dp.layer.shadowOffset = CGSize(width: 0, height: 4)
//        dp.layer.shadowOpacity = 0.8
//        dp.layer.shadowRadius = 4
////        dp.layer.borderWidth = 1
//        dp.layer.cornerRadius = 10
////        dp.layer.masksToBounds = false // Ensure shadow is visible
//        dp.backgroundColor = .systemGray6
// Ensure cell background is clear to show the shadow effecEnsu
        return dp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(datePicker)

        Layout.applyView(datePicker, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(date: Date?) {
        if let date = date {
            datePicker.date = date
        }
    }
}





