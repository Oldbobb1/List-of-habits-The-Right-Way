import UIKit
import ElementBuilder


class HabitTrackerCell: UITableViewCell {
    
    let nameLabelCell = UILabel()
    
    let messageLabel = UILabel()
    
    var habitName: String?
    
    var isCompleted: Bool = false

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabelCell)
        contentView.addSubview(messageLabel)
                
        messageLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold, width: .expanded)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        nameLabelCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-150)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(180)
            make.trailing.equalToSuperview().offset(-10)
        }

        
    }
    
    func set(object: HabitEntry, habitName: String) {
        nameLabelCell.text = object.name
        contentView.backgroundColor = object.color
        self.habitName = habitName // сохраняем имя привычки для использования в ключе UserDefaults
    }
    
}

