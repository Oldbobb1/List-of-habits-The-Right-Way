import  UIKit
import ElementBuilder


class HabitUI {

    let titleLabel = Label.label(text: "New Habit", fontSize: 25, weight: .bold, textColor: nil,textAlignment: .center, backgroundColor: .systemBackground,clipsToBounds: false)
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Cancel",cornerRadius: 15,setTitleColor: .systemGray, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let buttonSaveAndSendInTable = ButtonsWithAction.makeButton(setTitle: "Save", cornerRadius: 15, setTitleColor: .systemGray,clipsToBounds: false,backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let createTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    let selectedColorView: UIView = {
        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = .systemGray6
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
    }
    
    func setupView(_ view: UIView) {
        
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        createTableView.backgroundColor = .systemBackground
        createTableView.showsVerticalScrollIndicator = false

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


