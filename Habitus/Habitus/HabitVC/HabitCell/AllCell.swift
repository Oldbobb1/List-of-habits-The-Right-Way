//
//  AllCell.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit

class DateCell: UITableViewCell {
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time // Установите нужный режим выбора времени или даты
        dp.preferredDatePickerStyle = .wheels // Опционально, стиль выбора колеса
        return dp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(datePicker)
    
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
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


class DaysCell: UITableViewCell {
    
    let daysModel = DaysModel() // Создание экземпляра DaysModel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Добавление кнопок дней недели
        daysModel.setupDaysOfWeek(contentView)
                              
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
//        contentView.layer.borderWidth = 1
        
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(selectedDays: [Int]) {
        daysModel.selectedDays = selectedDays
//        daysModel.updateButtonStates(in: contentView)
    }
}


class textCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
          
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}
