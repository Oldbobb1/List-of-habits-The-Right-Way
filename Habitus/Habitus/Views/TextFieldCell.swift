import UIKit
import SnapKit
import ElementBuilder


class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name", cornerRadius: 10, backgroundColor: .systemBackground,clipsToBounds: false)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
                
        if traitCollection.userInterfaceStyle == .dark {
               textField.layer.shadowColor = UIColor.white.cgColor
           } else {
               textField.layer.shadowColor = UIColor.black.cgColor
           }
        
        layout()
        applyNeomorphism(to: textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        Layout.applyView(textField, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8)
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}
