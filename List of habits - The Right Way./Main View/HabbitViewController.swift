//  HabbitViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class HabbitViewController: UIViewController  {
    
    var swipe: SwipeClass?
    var habbit: HabbitModel!
        
    var textField = UITextField()
    var button1 = UIButton(), button2 = UIButton(), button3 = UIButton(), button4 = UIButton()
    var selectedColorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        habbit = HabbitModel()
        habbit.updateUI(view: self.view)
        
        textField = habbit.textField
        
        button1 = habbit.button1; button2 = habbit.button2; button3 = habbit.button3; button4 = habbit.button4
        
        selectedColorView = habbit.selectedColorView

        buttonAction(); updateSaveButtonState(); swipeActions()
        
        textField.delegate = self
    }
    
    private func buttonAction() {
        button1.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        button2.addTarget(self, action:  #selector(saveButtonTapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonWithOpenSetting), for: .touchUpInside)
        button4.addTarget(self, action: #selector(showColor), for: .touchUpInside)
    }
    
    @objc func buttonWithOpenSetting(_ sender: UIButton) {
        let view = SettingAlarmViewController()
        let navController = UINavigationController(rootViewController: view)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func swipeActions() {
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
}


extension HabbitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        //        // Обновляем цвет кнопки
        //        color.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        //        let selectedColor = viewController.selectedColor
        // Обновляем цвет кружка выбранного цвета
        //        selectedColorView.backgroundColor = selectedColor
        
        let selectedColor = viewController.selectedColor
        //        saveSelectedColor(selectedColor)
        selectedColorView.backgroundColor = selectedColor
        //        viewController.dismiss(animated: true, completion: nil)
    }
    
}

extension HabbitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
