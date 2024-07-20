import UIKit
import SnapKit
import ElementBuilder


class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name", cornerRadius: 10, backgroundColor: .systemBackground,clipsToBounds: false)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
        
//        textField.layer.shadowColor = UIColor.black.cgColor
//        textField.layer.shadowOffset = CGSize(width: -1, height: 1)
//        textField.layer.shadowOpacity = 0.5
//        textField.layer.shadowRadius = 4
        
        if traitCollection.userInterfaceStyle == .dark {
               // Настройка элементов для темной темы
               textField.layer.shadowColor = UIColor.white.cgColor
               // ...
           } else {
               // Настройка элементов для светлой темы
               textField.layer.shadowColor = UIColor.black.cgColor
               // ...
           }
        
        Layout.applyView(textField, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}
