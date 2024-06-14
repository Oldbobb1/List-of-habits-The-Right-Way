//
//  textField.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

func overrideUserInterfaceStyle(for traitCollection: UITraitCollection) -> UIUserInterfaceStyle {
       if traitCollection.userInterfaceStyle == .dark {
           // Темная тема
           return .light
       } else {
           // Светлая тема
           return .dark
       }
   }

func createTextField(height: CGFloat) -> UITextField {
    let text = UITextField()
    text.placeholder = "    Название привычки"
    
    let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.size.height)) // Измените значение width, чтобы установить отступ
    text.leftView = leftView
    text.leftViewMode = .always
//    text.borderStyle = .roundedRect
    text.autocorrectionType = .no
    text.layer.cornerRadius = 10
    text.layer.borderWidth = 1
    text.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
    text.font = UIFont.systemFont(ofSize: 15)
    text.heightAnchor.constraint(equalToConstant: height).isActive = true
    
//    if let saveText = UserDefaults.standard.object(forKey: "saveText") as? String {
//        text.text = saveText
//    }
    
   
    if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
        text.attributedPlaceholder = NSAttributedString(string: "    Название привычки", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    } else {
        text.attributedPlaceholder = NSAttributedString(string: "    Название привычки", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    return text
}
