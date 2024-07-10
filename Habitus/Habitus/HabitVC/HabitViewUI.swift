//  HabitViewUI.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import  UIKit

class HabitViewUI {

    let titleLabel = Label.label(text: "New Habit", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center)
    let buttonCloseUIView = ButtonsWithAction.addButtonWithAction(setTitle: "Cancel")
    let buttonSaveAndSendInTable = ButtonsWithAction.addButtonWithAction(setTitle: "Save")
    let createTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    let selectedColorView: UIView = {
        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()
    
    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(buttonCloseUIView)
        view.addSubview(buttonSaveAndSendInTable)
        view.addSubview(createTableView)
        view.addSubview(selectedColorView)
        
        createTableView.backgroundColor = .secondarySystemBackground
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        
        createTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        createTableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        createTableView.register(DatePickerCell.self, forCellReuseIdentifier: "DatePickerCell")
        createTableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")

        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0.99, leadingOffset: 0.5, trailingOffset: -285)
        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0.99, leadingOffset: 285, trailingOffset: -0.5)
        
        createTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
