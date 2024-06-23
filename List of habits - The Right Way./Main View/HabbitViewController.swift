//  HabbitViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class HabbitViewController: UIViewController  {
    
    var swipe: SwipeClass?; var habbit: HabbitModel!
    var textField = UITextField(); var button1 = UIButton(), button2 = UIButton(), button4 = UIButton()
    var selectedColorView = UIView(); var stack = UIStackView(); var  swichh = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        habbit = HabbitModel()
        habbit.updateUI(view: self.view)
        
        habbit.setupDaysOfWeek(view: view, traitCollection: traitCollection)
        
        textField = habbit.textField
        textField.delegate = self
        
        button1 = habbit.button1
        button2 = habbit.button2
        button4 = habbit.button4
        selectedColorView = habbit.selectedColorView
        stack = habbit.stackView;
        swichh = habbit.switchBut
        
        buttonAction()
        updateSaveButtonState()
        swipeActions()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        saveSwit() // Загружаем состояние при появлении модального экрана
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        UserDefaults.standard.set(swichh.isOn, forKey: "switch") // Сохраняем состояние при исчезновении
//    }
//    
//    func saveSwit() {
//        if let switchState = UserDefaults.standard.object(forKey: "switch") as? Bool {
//            swichh.isOn = switchState
//        }
//    }
    
    private func buttonAction() {
        button1.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        button2.addTarget(self, action:  #selector(saveButtonTapped), for: .touchUpInside)
        button4.addTarget(self, action: #selector(showColor), for: .touchUpInside)
        swichh.addTarget(self, action: #selector(switchSend), for: .valueChanged)
    }
    
    private func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction:{},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showColor(_ sender: UIButton) {
        let color  = UIColorPickerViewController()
        color.delegate = self
        self.present(color, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        guard let emojiName = textField.text else { return }
        let newEmoji = Emoji(name: emojiName )
        updateSaveButtonState()
        NotificationCenter.default.post(name: Notification.Name("NewEmojiAdded"), object: newEmoji)
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateSaveButtonState() {
        let nameText = textField.text ?? ""
        button2.isEnabled =  !nameText.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    @objc func switchSend( _ sender: UISwitch){
//        if sender.isOn {
//            
//        } else {
//            
//        }
    }
}

