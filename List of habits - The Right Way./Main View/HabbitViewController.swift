//  HabbitViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class HabbitViewController: UIViewController  {
    
    let label = Label.label(text: "New Habbit", fontSize: 25)
    let button1 = ButtonsWithAction.addButtonWithAction(setTitle: "Cancel", height: 33, width: 100)
    let button2 = ButtonsWithAction.addButtonWithAction(setTitle: "Save",height: 33, width: 10)
    let textField = TextField.createTextField(height: 40)
    let button3 = ButtonsWithAction.createButtonWithdAction(setTitle: "Repeat", height: 40)
    let button4 = ButtonsWithAction.createButtonWithdAction(setTitle: "Color", height: 40)

//    var alarmTime: Date?
    
    var date: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .time
        date.preferredDatePickerStyle = .wheels
        date.backgroundColor = UIColor.systemBackground
        
//        if let savedDate = UserDefaults.standard.object(forKey: "savedDate") as? Date {
//            date.date = savedDate
//        }
        return date
    }()
    
     var  selectedColorView: UIView = {
        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        swipe()
        
        savedUI()
        
        buttonAction() 
    }
    
    private func updateUI() {
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(label)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(textField)
        view.addSubview(date)
        view.addSubview(button3)
        view.addSubview(button4)
    
        button4.addSubview(selectedColorView)
        self.view.addSubview(button4)
        
        textField.delegate = self
            
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: -0)
        Layout.applyView(button1, view: view, topOffset: 0.99, leadingOffset: 0.5, trailingOffset: -285)
        Layout.applyView(button2, view: view, topOffset: 0.99, leadingOffset: 285, trailingOffset: -0.5)
        Layout.applyView(textField, view: view, topOffset: 120, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(date, view: view, topOffset: 170, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button3, view: view, topOffset: 399, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button4, view: view, topOffset: 445, leadingOffset: 10, trailingOffset: -10)
        
        selectedColorView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-10) // Помещаем кружок в правую часть кнопки
            make.centerY.equalToSuperview() // Центрируем по вертикали
        }
    }
    
    
    private func swipe() {
        
        let swipeClose = UISwipeGestureRecognizer(target: self, action: #selector(closeView))
        swipeClose.direction = .right
        self.view.addGestureRecognizer(swipeClose)
    }
    
    
    
    private func savedUI() {
        
//        if let savedColor = loadSelectedColor() {
             //                selectedColorView.backgroundColor = savedColor
             //            }
             //
             //        textField.addTarget(self, action: #selector(textFieldSave(_:)), for: .editingChanged)
       //              date.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    private func buttonAction() {
        
        button1.addTarget(self, action: #selector(closeView), for: .touchUpInside)
//        button2.addTarget(self, action:  #selector(closeView1), for: .touchUpInside)
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
//    @objc func closeView1() {
//        guard isTextFieldFilled && isColorPickerFilled else {
//            // Если хотя бы одно из полей не заполнено, не закрывать экран
//            return
//        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @objc func showColor(_ sender: UIButton) {
        let color  = UIColorPickerViewController()
        color.delegate = self
        self.present(color, animated: true, completion: nil)
    }
    
//    Метод, который будет вызываться при изменении времени в date picker
//      @objc func datePickerValueChanged(_ sender: UIDatePicker) {
////          alarmTime = date.date
//          UserDefaults.standard.set(sender.date, forKey: "savedDate")
//      }
    
  //    @objc func textFieldSave(_ textField: UITextField) {
  //        UserDefaults.standard.set(textField.text, forKey: "saveText")
  //    }
    
//    @objc  func saveSelectedColor(_ color: UIColor) {
   //        let colorData = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
   //        UserDefaults.standard.set(colorData, forKey: "selectedColor")
   //    }
   //
   //    // Метод для загрузки выбранного цвета из UserDefaults
   //    func loadSelectedColor() -> UIColor? {
   //        if let colorData = UserDefaults.standard.data(forKey: "selectedColor"),
   //           let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
   //            return color
   //        } else {
   //            return nil
   //        }
   //    }
   //
   //    // Метод, который будет вызываться при изменении цвета в UIView
   //    func colorViewDidChangeColor(_ color: UIColor) {
   //        saveSelectedColor(color)
   //    }  // Метод для сохранения выбранного цвета в UserDefaults


    
}



extension HabbitViewController: UIColorPickerViewControllerDelegate {
    //    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
    //        // Обновляем цвет кнопки
    //        color.backgroundColor = viewController.selectedColor
    //    }
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



