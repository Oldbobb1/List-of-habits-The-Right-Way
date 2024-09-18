import UIKit
import SnapKit
import ElementBuilder


class DatePickerCell: UITableViewCell {
    
    let datePicker = DatePicker.datePicker(datePickerMode: .time, preferredDatePickerStyle: .wheels, cornerRadius: 15, masksToBounds: false, backgroundColor: .systemGray6, clipsToBounds: false)
    
    var onTimeSelected: ((Date) -> Void)?
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
//        stackView.spacing = 10 // Отступ между контейнерами
//        stackView.backgroundColor = .green
        
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15) // Отступы от границ stackView

        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(datePicker)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(datePicker)

        datePicker.layer.shadowColor = UIColor.gray.cgColor
        datePicker.layer.shadowOffset = CGSize(width: 1, height: 3)
        datePicker.layer.shadowOpacity = 0.8
        datePicker.layer.shadowRadius = 6
//        datePicker.layer.borderColor = UIColor.red.cgColor
//        datePicker.layer.borderWidth = 1
    
        layout()
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
   }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
         onTimeSelected?(sender.date) // Передаем выбранное время через замыкание
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
            make.height.equalTo(140) // Высота stackView
        }
        
//        Layout.applyView(datePicker, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8)
    }
    
    func configure(date: Date?) {
        if let date = date {
            datePicker.date = date
        }
    }
}




