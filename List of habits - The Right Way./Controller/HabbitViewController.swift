//  HabbitViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class HabbitViewController: UIViewController  {
    
    var habbitView = HabbitView()
    var habbitModel: HabbitModel
    var days = DaysModel()
    
    var swipe: SwipeClass?
    
    init(habbitModel: HabbitModel) {
          self.habbitModel = habbitModel
          super.init(nibName: nil, bundle: nil)
      }
    
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveSwit(switchBut: habbitView.switchBut) // Загружаем состояние при появлении модального экрана
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(habbitView.switchBut.isOn, forKey: "switch") // Сохраняем состояние при исчезновении
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(); setupActions(); swipeActions()
    }
    func setup() {
        habbitView.updateUI(view)
        habbitView.updateSaveButtonState()
        habbitView.textField.delegate = self
        days.setupDaysOfWeek(view, traitCollection: traitCollection)
    }
    
    func setupActions(){
        habbitView.button1.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        habbitView.button2.addTarget(self, action:  #selector(saveButtonTapped), for: .touchUpInside)
        habbitView.button4.addTarget(self, action: #selector(showColor), for: .touchUpInside)
        habbitView.switchBut.addTarget(self, action: #selector(switchSend), for: .valueChanged)
        saveSwit(switchBut:habbitView.switchBut)
    }
    
    func saveSwit(switchBut: UISwitch) {
        if let switchState = UserDefaults.standard.object(forKey: "switch") as? Bool {
            switchBut.isOn = switchState
        }
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
        
    func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction:{},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    @objc func showColor(_ sender: UIButton) {
        let color  = UIColorPickerViewController()
        color.delegate = self
        self.present(color, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        guard let emojiName = habbitView.textField.text else { return }
        let newEmoji = Emoji(name: emojiName )
        habbitView.updateSaveButtonState()
        NotificationCenter.default.post(name: Notification.Name("NewEmojiAdded"), object: newEmoji)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        habbitView.updateSaveButtonState()
    }
    
    @objc func switchSend( _ sender: UISwitch){
//        if sender.isOn {
//            
//        } else {
//            
//        }
    }
}

