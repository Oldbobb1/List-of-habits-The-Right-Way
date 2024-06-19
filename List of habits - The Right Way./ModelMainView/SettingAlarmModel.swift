//  SettingAlarmModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class SettingAlarmModel {
    
    let label = Label.label(text: "Signal repetition", fontSize: 18)
    let stackView = StackView.stack()
    let button = ButtonsWithAction.addButtonWithAction(setTitle:"Back", height: 35, width: 100)
    
    let switchBut: UISwitch = {
        let switchButton = UISwitch()
        switchButton.isOn = false
        //        if let switchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
        //            switchButton.isOn = switchState
        //        }
        return switchButton
    }()
    
    func updateUI(view: UIView) {
        
        view.backgroundColor = UIColor.systemBackground

        label.textAlignment = .left
        //        stackView.backgroundColor = UIColor(red: 0, green: 180/255, blue: 1, alpha: 1)
        stackView.layer.cornerRadius = 10
//        stackView.layer.borderWidth = 1
//        stackView.layer.borderColor = UIColor.red.cgColor
        
        view.addSubview(button); view.addSubview(stackView)
        stackView.addArrangedSubview(label); stackView.addArrangedSubview(switchBut)
        
        Layout.applyView(button, view: view, topOffset: 0.9, leadingOffset: 0.5, trailingOffset: -285)
        Layout.applyView(stackView, view: view, leadingOffset: 10,trailingOffset: -10 , additionalConstraints: { make in
            make.top.equalTo(self.button.snp.bottom).offset(330)
            make.height.equalTo(38)
        })
        Layout.applyView(label, view: view, leadingOffset: 20 , additionalConstraints: {make in
            make.top.equalToSuperview().offset(-2)
        })
        Layout.applyView(switchBut, view: view,trailingOffset: -14 , additionalConstraints: {make in
            make.top.equalToSuperview().offset(4)
        })
    }    
}

