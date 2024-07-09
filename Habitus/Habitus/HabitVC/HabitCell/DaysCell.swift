//  DaysCell.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

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
