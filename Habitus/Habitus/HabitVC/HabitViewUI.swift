//  HabitViewUI.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import  UIKit
import ElementBuilder

class HabitViewUI {

    let titleLabel = Label.label(text: "New Habit", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center)
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Cancel")
    let buttonSaveAndSendInTable = ButtonsWithAction.makeButton(setTitle: "Save")
//    let createTableView = UITableView(frame: .zero, style: .insetGrouped)
    let createTableView = TableView.tableView(frame: .zero, style: .insetGrouped, backgroundColor: .systemBackground)
    
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
        
//        buttonCloseUIView.layer.shadowColor = UIColor.blue.cgColor
//        buttonCloseUIView.layer.shadowOffset = CGSize(width: 1, height: 4)
//        buttonCloseUIView.layer.shadowOpacity = 1
//        buttonCloseUIView.layer.shadowRadius = 2
//
//        buttonSaveAndSendInTable.layer.cornerRadius = 10
//        buttonSaveAndSendInTable.layer.shadowColor = UIColor.label.cgColor
//        buttonSaveAndSendInTable.layer.shadowOffset = CGSize(width: 0, height: 4)
//        buttonSaveAndSendInTable.layer.shadowOpacity = 0.5
//        buttonSaveAndSendInTable.layer.shadowRadius = 4
////        buttonSaveAndSendInTable.backgroundColor = UIColor.systemGray4
//        
//        titleLabel.layer.cornerRadius = 10
//        titleLabel.layer.shadowColor = UIColor.black.cgColor
//        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
//        titleLabel.layer.shadowOpacity = 0.5
//        titleLabel.layer.shadowRadius = 4
        
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        
        createTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        createTableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        createTableView.register(DatePickerCell.self, forCellReuseIdentifier: "DatePickerCell")
        createTableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -280)
        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0, leadingOffset: 280, trailingOffset: -10)
        
        createTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
