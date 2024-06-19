//  textField.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

public class TextField {
    public  static func createTextField(height: CGFloat, placeholder: String ) -> UITextField {
        let text = UITextField()
        text.placeholder = placeholder
        text.borderStyle = .roundedRect
        text.autocorrectionType = .yes
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 15)
        text.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            text.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        } else {
            text.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        }
        return text
    }
}
