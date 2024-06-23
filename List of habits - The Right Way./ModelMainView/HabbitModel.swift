//  HabbitModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class HabbitModel {
    
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
    
    let days = ["All","Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
    var selectedDay: String?
    
    let  selectedColorView: UIView = {
        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()
    
    let stackView = StackView.stack()
    
    let labelswitch = Label.label(text: "Signal repetition", fontSize: 18)
    

    let  switchBut = ButtonsWithAction.createSwitchButton(isOn: false)
    
    var selectedDays = [Int]()
    
    func updateUI(view:UIView) {
        
        view.backgroundColor = UIColor.systemBackground
        
        labelswitch.textAlignment = .left
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        stackView.layer.borderWidth = 1
        
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
        
        Layout.applyView(labelswitch, view: view, leadingOffset: 20 , additionalConstraints: {make in
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
            dayButton.contentHorizontalAlignment = .center // Выравнивание текста по центру
//            dayButton.layer.cornerRadius = 10
//            dayButton.layer.borderWidth = 1
            dayButton.layer.borderColor = UIColor.red.cgColor
            
            if traitCollection.userInterfaceStyle == .dark {
                dayButton.setTitleColor(.label, for: .normal)
            } else {
                dayButton.setTitleColor(.label, for: .normal)
            }
            view.addSubview(dayButton)
            
            dayButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(495)
                make.leading.equalToSuperview().offset(10 + index * 48) //49
                make.width.equalTo(38) // Устанавливаем фиксированную ширину
                make.height.equalTo(40)
            }
            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }
        if index == 0 {
            if selectedDays.count == days.count - 1 {
                selectedDays.removeAll() // Сбросить выбор
            } else {
                selectedDays = Array(1..<days.count)
            }
        } else {
            if selectedDays.contains(index) {
                selectedDays.removeAll(where: { $0 == index })
            } else {
                selectedDays.append(index)
            }
        }
        for (index, day) in days.enumerated() {
            guard let button = sender.superview?.subviews.compactMap({ $0 as? UIButton }).first(where: { $0.titleLabel?.text == day }) else { continue }
            if selectedDays.contains(index) {
                button.backgroundColor = .systemBlue
            } else {
                button.backgroundColor = .clear
            }
        }
    }
}

