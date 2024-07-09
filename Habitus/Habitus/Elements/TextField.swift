//  TextField.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

public class TextField {
//height: CGFloat
    public static func textField(placeholder: String ) -> UITextField {
        let text = UITextField()
        text.placeholder = placeholder
        text.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor: UIColor.label] )
        text.borderStyle = .roundedRect
        text.autocorrectionType = .yes
        text.layer.cornerRadius = 10
        text.font = UIFont.systemFont(ofSize: 15)
//        text.heightAnchor.constraint(equalToConstant: height).isActive = true
        return text
    }
}
