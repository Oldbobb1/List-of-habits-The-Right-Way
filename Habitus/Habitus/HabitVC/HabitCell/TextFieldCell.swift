//  TextFieldCell.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit
import SnapKit
import ElementBuilder

class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
    
//        textField.layer.cornerRadius = 10
//        textField.layer.shadowColor = UIColor.black.cgColor
//        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
//        textField.layer.shadowOpacity = 0.6
//        textField.layer.shadowRadius = 4
//        textField.backgroundColor = UIColor.systemGray6
        
//        textField.layer.shadowColor = UIColor.blue.cgColor
//        textField.layer.shadowOffset = CGSize(width: 1, height: 4)
//        textField.layer.shadowOpacity = 1
//        textField.layer.shadowRadius = 2
    
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
