//  textCell.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
          
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}
