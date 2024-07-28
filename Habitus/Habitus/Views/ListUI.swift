import UIKit
import ElementBuilder


class ListUI {
    
    let titleLabel = Label.label(text: "List", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let messageLabel = Label.label(text: "Add Habit", fontSize: 20, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let calendarDateStackView = StackView.stackView(axis: .horizontal)
    
    let userContentTableView = UITableView()
   
    let buttonOpenHabitVC = ButtonsWithAction.makeButton(backgroundColor: .clear, systemName: "plus.circle", setImage: nil,alpha: 0.5)
    
    func initializeUI(_ view: UIView) {
        
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(calendarDateStackView)
        view.addSubview(userContentTableView)
        view.addSubview(buttonOpenHabitVC)
        self.userContentTableView.addSubview(buttonOpenHabitVC)
        self.userContentTableView.addSubview(messageLabel)
        
        setupView(view)
        layout(view)
    }
    
    func setupView(_ view: UIView) {
        userContentTableView.frame = view.bounds
        userContentTableView.showsVerticalScrollIndicator = false
        userContentTableView.register(HabitTrackerCell.self, forCellReuseIdentifier: "habitCell")
    }
    
    func layout(_ view: UIView) {
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        
        Layout.applyView(calendarDateStackView, view: view , leadingOffset: 285, trailingOffset: 0, additionalConstraints: {make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(0)
            make.height.equalTo(38)
        })
        
        Layout.applyView(userContentTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
//            make.top.equalTo(self.calendarDateStackView.snp.bottom).offset(5)
                        make.top.equalTo(self.calendarDateStackView.snp.bottom).offset(5)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        })
        
        Layout.applyView(messageLabel, view: view, topOffset: 300, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(buttonOpenHabitVC, view: view, leadingOffset: 10 , bottomOffset: -60)
    }
}

