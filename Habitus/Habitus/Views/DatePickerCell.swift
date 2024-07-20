import UIKit
import SnapKit
import ElementBuilder


class DatePickerCell: UITableViewCell {
    
    let datePicker = DatePicker.datePicker(datePickerMode: .time, preferredDatePickerStyle: .wheels, cornerRadius: 10, masksToBounds: false, backgroundColor: .systemBackground, clipsToBounds: false, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 1, height: 1), shadowOpacity: 1, shadowRadius: 4)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if traitCollection.userInterfaceStyle == .dark {
               // Настройка элементов для темной темы
            datePicker.layer.shadowColor = UIColor.white.cgColor
               // ...
           } else {
               // Настройка элементов для светлой темы
               datePicker.layer.shadowColor = UIColor.black.cgColor
               // ...
           }
        
        contentView.addSubview(datePicker)
        Layout.applyView(datePicker, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8)
applyNeomorphism(to: datePicker)
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








//public class DatePicker {
//    public static func datePicker(datePickerMode: UIDatePicker.Mode? = nil, preferredDatePickerStyle: UIDatePickerStyle? = nil, cornerRadius: CGFloat? = nil, masksToBounds: Bool? = nil, backgroundColor: UIColor? = nil, clipsToBounds: Bool? = nil, shadowColor: CGColor? = nil, shadowOffset: CGSize? = nil, shadowOpacity: Float? = nil, shadowRadius: CGFloat? = nil) -> UIDatePicker {
//
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = datePickerMode ?? .time
//        datePicker.preferredDatePickerStyle = preferredDatePickerStyle ?? .wheels
//        datePicker.layer.cornerRadius = cornerRadius ?? 0
//        datePicker.layer.masksToBounds = masksToBounds ?? false
//        datePicker.backgroundColor = backgroundColor ?? .systemBackground
//        datePicker.clipsToBounds = clipsToBounds ?? false
//        datePicker.layer.shadowColor = shadowColor
//        datePicker.layer.shadowOffset = CGSize(width: 0, height: 0)
//        datePicker.layer.shadowOpacity = shadowOpacity ?? 0
//        datePicker.layer.shadowRadius = shadowRadius ?? 0
//        return datePicker
//    }
//}
