import  UIKit
import ElementBuilder


class HabitUI {

    let titleLabel = Label.label(text: "New Habit", fontSize: 25, weight: .bold, textColor: nil,textAlignment: .center, backgroundColor: .systemBackground,clipsToBounds: false, cornerRadius: 10)
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Cancel",cornerRadius: 10,setTitleColor: .label, clipsToBounds: false)
    
    let buttonSaveAndSendInTable = ButtonsWithAction.makeButton(setTitle: "Save", cornerRadius: 10,clipsToBounds: false)
    
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
        
        layout(view)
        setupView(view)
   
        applyNeomorphism(to: buttonCloseUIView)
        applyNeomorphism(to: buttonSaveAndSendInTable)
        applyNeomorphism(to: titleLabel)
    }
    
    func setupView(_ view: UIView) {
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        
        createTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        createTableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        createTableView.register(DatePickerCell.self, forCellReuseIdentifier: "DatePickerCell")
        createTableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")
    }
    
    func layout(_ view: UIView) {
        Layout.applyView(titleLabel, view: view, topOffset: 0.85, leadingOffset: 124, trailingOffset: -124)
        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -280)
        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0, leadingOffset: 280, trailingOffset: -10)
        Layout.applyView(createTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            make.leading.trailing.bottom.equalToSuperview()
        })
    }

}

