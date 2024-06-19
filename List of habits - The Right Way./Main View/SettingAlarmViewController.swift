//  SettingAlarmViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class SettingAlarmViewController: UIViewController {
    
    var button = UIButton(), swipe: SwipeClass?, setting:SettingAlarmModel!
    var stackView = UIStackView()
        let days = ["  Every Monday", "  Every Tuesday", "  Every Wednesday", "  Every Thursday", "  Every Friday", "  Every Saturday", "  Every Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting = SettingAlarmModel(); setting.updateUI(view: self.view)
        
        stackView = setting.stackView
        
        button = setting.button; buttonAction(); swipeActions()
                setupDaysOfWeek()
    }
    
    private func buttonAction() {
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction: {},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
    func setupDaysOfWeek() {
        for (index, day) in days.enumerated() {
            let dayButton = UIButton()
            dayButton.setTitle(day, for: .normal)
            dayButton.contentHorizontalAlignment = .left
            dayButton.layer.cornerRadius = 10
            dayButton.layer.borderWidth = 1
            dayButton.layer.borderColor = UIColor.red.cgColor
            
            if self.traitCollection.userInterfaceStyle == .dark {
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

