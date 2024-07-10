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





