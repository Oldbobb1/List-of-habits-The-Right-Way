import UIKit
import SnapKit
import ElementBuilder


class DatePickerCell: UITableViewCell {
    
    let datePicker = DatePicker.datePicker(datePickerMode: .time, preferredDatePickerStyle: .wheels, cornerRadius: 15, masksToBounds: false, backgroundColor: .systemGray6, shadowColor: UIColor.darkGray.cgColor, shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1,shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .horizontal, distribution: .fillEqually,cornerRadius: 15,layoutMargins: .init(top: 15, left: 15, bottom: 15, right: 15))
    
    var onTimeSelected: ((Date) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(datePicker)
        
        layout()
        
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        datePicker.addAction(UIAction(handler:{[weak self] _ in
            guard let self = self else {return}
            self.datePickerValueChanged(datePicker)
        }), for: .valueChanged)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private func datePickerValueChanged(_ sender: UIDatePicker) {
        onTimeSelected?(sender.date) // Передаем выбранное время через замыкание
    }
    
    func layout() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
            make.height.equalTo(140) // Высота stackView
        }
    }
    
    func configure(date: Date?) {
        if let date = date {
            datePicker.date = date
        }
    }
}




