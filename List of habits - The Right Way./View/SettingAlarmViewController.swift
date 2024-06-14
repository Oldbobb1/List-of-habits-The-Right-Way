//  SettingAlarmViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class SettingAlarmViewController: UIViewController {
    
    let button = addButtonWithAction(setTitle:"Back", height: 35, width: 100)
    let label = Label.label(text: "Signal repetition", fontSize: 18)
    let stackView1 = stack()

    let switchBut: UISwitch = {
        let switchButton = UISwitch()
        switchButton.isOn = false
        //        // В методе viewDidLoad или в методе, где вы настраиваете switch button
        //        if let switchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
        //            switchButton.isOn = switchState
        //        }
        return switchButton
    }()
    
    let days = ["Every Monday", "Every Tuesday", "Every Wednesday", "Every Thursday", "Every Friday", "Every Saturday", "Every Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textAlignment = .left
        stackView1.backgroundColor = UIColor(red: 0, green: 180/255, blue: 1, alpha: 1)
        stackView1.layer.cornerRadius = 10
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(stackView1)
        stackView1.addArrangedSubview(label)
        view.addSubview(button)
        stackView1.addArrangedSubview(switchBut)
        
        setupDaysOfWeek()
        
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        Layout.applyView(button, view: view, topOffset: 0.9, leadingOffset: 0.5, trailingOffset: -285)
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(330)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(38)
        }
        label.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(-2)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        switchBut.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-14)
        }
        
        let swipeClose = UISwipeGestureRecognizer(target: self, action: #selector(closeView))
        swipeClose.direction = .right
        self.view.addGestureRecognizer(swipeClose)
        
    }
        
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupDaysOfWeek() {
        
        for (index, day) in days.enumerated() {
            let dayButton = UIButton()
            dayButton.setTitle(day, for: .normal)
            //            dayButton.setTitleColor(.black, for: .normal)
            
            var config = UIButton.Configuration.plain()
            config.titlePadding = 10
            dayButton.configuration = config
            
            dayButton.backgroundColor =  UIColor(red: 255/255, green: 180/255, blue: 0, alpha: 1)
            
            //                .clear
            //                                         .systemMint
            //                                         .systemGray5
            dayButton.contentHorizontalAlignment = .left
            dayButton.layer.cornerRadius = 10
            //            dayButton.layer.borderWidth = 0.8
            
            if self.traitCollection.userInterfaceStyle == .dark {
                dayButton.setTitleColor(.label, for: .normal)
            } else {
                dayButton.setTitleColor(.label, for: .normal)
            }
            
            view.addSubview(dayButton)
            
//            Layout.applyView(dayButton, view: view, additionalConstraints: { make in
//                make.top.equalToSuperview().offset(160 + index * 38)
//                make.leading.equalToSuperview().offset(10)
//                make.trailing.equalToSuperview().offset(-10)
//                //                make.height.equalToSuperview().offset(40)
//            })
        
            dayButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(160 + index * 38)
                make.leading.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-10)
                //                make.height.equalToSuperview().offset(40)
            }
            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        // Проверяем, есть ли уже добавленная галочка на кнопке
        if let checkmarkLabel = view.subviews.compactMap({ $0 as? UILabel }).first(where: { $0.center.y == sender.center.y }) {
            // Если галочка уже добавлена - удаляем ее
            checkmarkLabel.removeFromSuperview()
//            UserDefaults.standard.set(false, forKey: "checkmarkSave")
        } else {
            // Иначе создаем новую галочку и добавляем на кнопку
            let checkmarkLabel = UILabel()
            checkmarkLabel.text = "✓"
            checkmarkLabel.textColor = .blue
            checkmarkLabel.font = UIFont.systemFont(ofSize: 30)
            checkmarkLabel.sizeToFit()
            checkmarkLabel.frame.origin.x = sender.frame.maxX - 20
            checkmarkLabel.center.y = sender.center.y
            
            view.addSubview(checkmarkLabel)
//            UserDefaults.standard.set(false, forKey: "checkmarkSave")
            
        }
    }
    
}



