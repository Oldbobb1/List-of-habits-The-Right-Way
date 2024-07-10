//  TextFieldCell.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit
import SnapKit

class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true

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
