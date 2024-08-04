import UIKit
import SnapKit
import ElementBuilder


class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name", cornerRadius: 10, clipsToBounds: false)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(textField)
        contentView.clipsToBounds = true

        textField.contentMode = .scaleAspectFill
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowRadius = 4
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        layout()
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




