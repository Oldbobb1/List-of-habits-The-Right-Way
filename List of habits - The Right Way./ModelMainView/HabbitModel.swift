//
//  HabbitModel.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 19.06.24.
//

import UIKit

class HabbitModel {
    
    let label = Label.label(text: "New Habbit", fontSize: 25)
    let button1 = ButtonsWithAction.addButtonWithAction(setTitle: "Cancel", height: 33, width: 100)
    let button2 = ButtonsWithAction.addButtonWithAction(setTitle: "Save",height: 33, width: 10)
    let textField = TextField.createTextField(height: 40, placeholder: "  habit name")
    let button3 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Repeat", height: 40)
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
        
    func updateUI(view:UIView) {
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(label); view.addSubview(button1); view.addSubview(button2); view.addSubview(textField)
        view.addSubview(date); view.addSubview(button3); view.addSubview(button4); button4.addSubview(selectedColorView)

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
}
