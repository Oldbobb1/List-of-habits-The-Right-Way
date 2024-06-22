//  SettingAlarmViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class SettingAlarmViewController: UIViewController {
    
    var button = UIButton(), swipe: SwipeClass?, setting:SettingAlarmModel!
    var stackView = UIStackView()
    
    let daysOfWeek = SettingAlarmModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting = SettingAlarmModel(); setting.updateUI(view: self.view)
        
        stackView = setting.stackView
        
        button = setting.button; buttonAction(); swipeActions(); //setupDaysOfWeek()
        
        daysOfWeek.setupDaysOfWeek(view: view, traitCollection: traitCollection)
        
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
    //    @objc func dayButtonTapped(sender: UIButton) {
    //        daysOfWeek.dayButtonTapped(sender: sender)
    //    }
}

