//
//  LIstView.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 27.06.24.
//

import UIKit

class ListView {
    
    let label = Label.label(text: "List", fontSize: 25)
    let stackView = StackView.stack()
    let table = TableView.createNewTableView()
    let button = ButtonsWithAction.addButtonImage(systemName: "plus.circle", setImage: nil )

    func updateUI(_ view: UIView) {
        
        view.addSubview(label)
        view.addSubview(stackView)
        view.addSubview(table)
        view.addSubview(button)
        self.table.addSubview(button)
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0 )
        
        Layout.applyView(stackView, view: view , leadingOffset: 270, trailingOffset: 0,  additionalConstraints: {make in
            make.top.equalTo(self.label.snp.bottom).offset(0)
            make.height.equalTo(38)
        })
        
        Layout.applyView(table, view: view, leadingOffset: 10 , trailingOffset: -10, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.stackView.snp.bottom).offset(5)
        })
        
        Layout.applyView(button, view: view, leadingOffset: 15 , bottomOffset: -10)
        
    }
    
    func updateCalendar() {
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateCurrent(to: stackView, withDay: day)
        }
    }
    
}
