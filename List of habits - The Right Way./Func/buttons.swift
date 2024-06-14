//
//  Buttons.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

    
  func createButtonWithTextAndAction(setTitle: String, height: CGFloat ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: .normal)
        //    button.setTitleColor(.darkText, for: .normal)
        button.contentHorizontalAlignment = .left
        
        var config = UIButton.Configuration.plain()
        config.titlePadding = 10
        button.configuration = config
        
        button.backgroundColor = .white
        //    button.backgroundColor = UIColor(red: 0, green: 180/255, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        //    button.layer.borderWidth = 0.5
        //    button.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            button.setTitleColor(.label, for: .normal)
        }
        else {
            button.setTitleColor(.black, for: .normal)
        }
        return button
    }
    
 func addButtonWithAction(setTitle: String, height: CGFloat, width: CGFloat) -> UIButton {
        let but = UIButton(type: .system)
        but.setTitle(setTitle, for: .normal)
        //    but.setTitleColor(.black, for: .normal)
        
        var config = UIButton.Configuration.plain()
        config.titlePadding = 10
        but.configuration = config
        //    but.backgroundColor = .black
        //    but.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 19/255, alpha: 0.6)
        //    but.contentHorizontalAlignment = .left
        //    but.layer.borderWidth = 0.8
        //    but.layer.cornerRadius = 10
        but.heightAnchor.constraint(equalToConstant: height).isActive = true
        but.widthAnchor.constraint(equalToConstant: height).isActive = true
        but.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            but.setTitleColor(.label, for: .normal)
        }
        else {
            but.setTitleColor(.label, for: .normal)
        }
        return but
    }
    
    
    
    // функция с установкой размеров для изображения
  func addButtonImage(systemName: String, setImage: UIImage?) -> UIButton {
        let button = UIButton(type: .system)
        let image = setImage ?? UIImage(systemName: systemName)
        let newSize = CGSize(width: 65, height: 60)
        UIGraphicsBeginImageContext(newSize)
        image?.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        button.setImage(newImage, for: .normal)
        button.alpha = 0.5
        button.layer.cornerRadius = 360
        return button
    }
    
    
    
  func createSwitchButton(isOn: Bool) -> UISwitch {
        let switchButton = UISwitch()
        switchButton.isOn = isOn
        
        // В методе viewDidLoad или в методе, где вы настраиваете switch button
        if let switchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
            switchButton.isOn = switchState
        }
        
        return switchButton
    }
    
    
    
    
    
    
    
