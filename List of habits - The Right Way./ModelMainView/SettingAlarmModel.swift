//  SettingAlarmModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class SettingAlarmModel {
    
    let label = Label.label(text: "Signal repetition", fontSize: 18)
    let stackView = StackView.stack()
    let button = ButtonsWithAction.addButtonWithAction(setTitle:"Back", height: 35, width: 100)
    let days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

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
    
    func setupDaysOfWeek(view: UIView, traitCollection: UITraitCollection) {
        for (index, day) in days.enumerated() {
            let dayButton = UIButton()
            dayButton.setTitle(day, for: .normal)
            dayButton.contentHorizontalAlignment = .left
            dayButton.layer.cornerRadius = 10
            dayButton.layer.borderWidth = 1
            dayButton.layer.borderColor = UIColor.red.cgColor
            
            if traitCollection.userInterfaceStyle == .dark {
                dayButton.setTitleColor(.label, for: .normal)
            } else {
                dayButton.setTitleColor(.label, for: .normal)
            }
            view.addSubview(dayButton)
            
            dayButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(160 + index * 38)
                make.leading.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-10)
            }
            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        if let checkmarkLabel = sender.superview?.subviews.compactMap({ $0 as? UILabel }).first(where: { $0.center.y == sender.center.y }) {
            checkmarkLabel.removeFromSuperview()
            //            UserDefaults.standard.set(false, forKey: "checkmarkSave")
        } else {
            let checkmarkLabel = UILabel()
            checkmarkLabel.text = "✓"
            checkmarkLabel.textColor = .blue
            checkmarkLabel.font = UIFont.systemFont(ofSize: 30)
            checkmarkLabel.sizeToFit()
            checkmarkLabel.frame.origin.x = sender.frame.maxX - 20
            checkmarkLabel.center.y = sender.center.y
            
            sender.superview?.addSubview(checkmarkLabel)
            UserDefaults.standard.set(false, forKey: "checkmarkSave")
        }
    }
}
