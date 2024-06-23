//  Buttons.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

public class ButtonsWithAction {
    
    public static  func createButtonWithdAction(setTitle: String, height: CGFloat ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            button.setTitleColor(.darkText, for: .normal)
        }
        else {
            button.setTitleColor(.darkText, for: .normal)
        }
        return button
    }
    
    public static  func addButtonWithAction(setTitle: String, height: CGFloat, width: CGFloat) -> UIButton {
        let but = UIButton(type: .system)
        but.setTitle(setTitle, for: .normal)
        but.heightAnchor.constraint(equalToConstant: height).isActive = true
        but.widthAnchor.constraint(equalToConstant: height).isActive = true
        but.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        var config = UIButton.Configuration.plain()
        config.titlePadding = 10
        but.configuration = config
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
            but.setTitleColor(.label, for: .normal)
        }
        else {
            but.setTitleColor(.label, for: .normal)
        }
        return but
    }
    
    // MARK: - функция с установкой размеров для изображения.
    
    public static func addButtonImage(systemName: String, setImage: UIImage?) -> UIButton {
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
    
    public static func createSwitchButton(isOn: Bool) -> UISwitch {
        let switchButton = UISwitch()
        switchButton.isOn = isOn
//        switchButton.thumbTintColor = .blue
        if let switchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
            switchButton.isOn = switchState
        }
        return switchButton
    }
}


