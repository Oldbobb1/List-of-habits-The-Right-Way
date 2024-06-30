//  HabbitView.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 27.06.24.

import UIKit

class HabbitView {
    
    let label = Label.label(text: "New Habbit", fontSize: 25)
    let button1 = ButtonsWithAction.addButtonWithAction(setTitle: "Cancel", height: 33, width: 100)
    let button2 = ButtonsWithAction.addButtonWithAction(setTitle: "Save",height: 33, width: 10)
    let textField = TextField.createTextField(height: 40, placeholder: "  habit name")
    let button4 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Color", height: 40)
    
    let date: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .time
        date.preferredDatePickerStyle = .wheels
        date.backgroundColor = UIColor.systemBackground
        //        if let savedDate = UserDefaults.standard.object(forKey: "savedDate") as? Date {
        //            date.date = savedDate
        //        }
        return date
    }()
    
    let  selectedColorView: UIView = {
        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()
    
    let stackView = StackView.stack()
    let labelswitch = Label.label(text: "  Signal repetition", fontSize: 18)
    let  switchBut = ButtonsWithAction.createSwitchButton(isOn: false)
    
    func updateUI(_ view: UIView) {
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(label)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(textField)
        view.addSubview(date)
        view.addSubview(button4)
        button4.addSubview(selectedColorView)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(labelswitch)
        stackView.addArrangedSubview(switchBut)
        
        labelswitch.textAlignment = .left
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 10
        //        stackView.backgroundColor = .systemBlue
        //        button4.backgroundColor = .systemRed
        button4.layer.cornerRadius = 10
        button4.layer.borderWidth = 1
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        Layout.applyView(button1, view: view, topOffset: 0.99, leadingOffset: 0.5, trailingOffset: -285)
        Layout.applyView(button2, view: view, topOffset: 0.99, leadingOffset: 285, trailingOffset: -0.5)
        Layout.applyView(textField, view: view, topOffset: 120, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(date, view: view, topOffset: 170, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button4, view: view, topOffset: 445, leadingOffset: 10, trailingOffset: -10)
        
        selectedColorView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-10) // Помещаем кружок в правую часть кнопки
            make.centerY.equalToSuperview() // Центрируем по вертикали
        }
        
        Layout.applyView(stackView, view: view,topOffset: 491, leadingOffset: 10,trailingOffset: -10 , additionalConstraints: { make in
            make.height.equalTo(40)
        })
        
//        Layout.applyView(labelswitch, view: view, leadingOffset: 20 , additionalConstraints: {make in
//            make.top.equalToSuperview().offset(-2)
//        })
//        
        Layout.applyView(switchBut, view: view,trailingOffset: -14 , additionalConstraints: {make in
            make.top.equalToSuperview().offset(4)
        })
    }
    
    func updateSaveButtonState() {
        let nameText = textField.text ?? ""
        button2.isEnabled =  !nameText.isEmpty
    }
    
}
