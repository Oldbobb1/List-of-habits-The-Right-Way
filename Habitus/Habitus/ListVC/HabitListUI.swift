//  HabitListUI.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class HabitListUI  {
    
    let titleLabel = Label.label(text: "List", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center)
    let messageLabel = Label.label(text: "Add Habit", fontSize: 20, weight: .bold, textColor: nil, textAlignment: .center)
    let calendarDateStackView = StackView.stackView()
    let userContentTableView = TableView.tableView(frame: .zero, style: .plain, backgroundColor: .secondarySystemBackground)
    let buttonOpenHabitVC = ButtonsWithAction.createButtonWithSystemImage(systemName: "plus.circle", setImage: nil )
    
    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(calendarDateStackView)
        view.addSubview(userContentTableView)
        view.addSubview(buttonOpenHabitVC)
        self.userContentTableView.addSubview(buttonOpenHabitVC)
        self.userContentTableView.addSubview(messageLabel)
        
        userContentTableView.frame = view.bounds
        userContentTableView.register(HabitTrackerCell.self, forCellReuseIdentifier: "habitCell")
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        Layout.applyView(calendarDateStackView, view: view , leadingOffset: 285, trailingOffset: 0, additionalConstraints: {make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(0)
            make.height.equalTo(38)
        })
        
        Layout.applyView(userContentTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.calendarDateStackView.snp.bottom).offset(5)
        })
        
        Layout.applyView(messageLabel, view: view, topOffset: 300, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(buttonOpenHabitVC, view: view, leadingOffset: 15 , bottomOffset: -10)
    }
    
    func updateDaysCalendar() {
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateCurrent(to: calendarDateStackView, withDay: day)
        }
    }
}
