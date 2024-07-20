import UIKit


class DaysCell: UITableViewCell {
    
    let daysModel = DaysModel() // Создание экземпляра DaysModel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Добавление кнопок дней недели
        daysModel.setupDaysOfWeek(contentView, userInterfaceStyle: traitCollection.userInterfaceStyle)
        
        contentView.clipsToBounds = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(selectedDays: [Int]) {
        daysModel.selectedDays = selectedDays
//        daysModel.updateButtonStates(in: contentView)
    }
    
}
