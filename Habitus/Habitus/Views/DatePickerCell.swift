import UIKit
import SnapKit
import ElementBuilder


class DatePickerCell: UITableViewCell {
    
    let datePicker = DatePicker.datePicker(datePickerMode: .time, preferredDatePickerStyle: .wheels, cornerRadius: 10, masksToBounds: false, backgroundColor: .systemGray6, clipsToBounds: false)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(datePicker)

        datePicker.layer.shadowColor = UIColor.black.cgColor
        datePicker.layer.shadowOffset = CGSize(width: 0, height: 2)
        datePicker.layer.shadowOpacity = 0.2
        datePicker.layer.shadowRadius = 4
    
        layout()
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        Layout.applyView(datePicker, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8)
    }
    
    func configure(date: Date?) {
        if let date = date {
            datePicker.date = date
        }
    }
}

