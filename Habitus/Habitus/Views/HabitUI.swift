import  UIKit
import ElementBuilder


class HabitUI {
    
    let titleLabel = Label.label(text: "New Habit", fontSize: 28, weight: .bold, textColor: nil,textAlignment: .center, backgroundColor: .clear,clipsToBounds: false)

    let buttonCloseUIView = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"x.circle", setImage: nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.systemRed.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4, tintColor: .red)

    let buttonSaveAndSendInTable = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"paperplane.circle", setImage:nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.systemRed.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4, tintColor: .red)
    
    let createTableView = UITableView(frame: .zero, style: .insetGrouped)

    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(buttonCloseUIView)
        view.addSubview(buttonSaveAndSendInTable)
        view.addSubview(createTableView)
        
        layout(view)
        setupView(view)
    }
    
    func setupView(_ view: UIView) {
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        createTableView.backgroundColor = .systemBackground
        createTableView.showsVerticalScrollIndicator = false
        createTableView.layer.cornerRadius = 25

        createTableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        createTableView.register(DatePickerCell.self, forCellReuseIdentifier: "DatePickerCell")
        createTableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")
        createTableView.register(TexеCell.self, forCellReuseIdentifier: "TexеCell")
    }
    
    func layout(_ view: UIView) {
        Layout.applyView(titleLabel, view: view, topOffset: 0.85, leadingOffset: 10, trailingOffset: -10)

        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 20)

        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0, trailingOffset: -20)
        
        Layout.applyView(createTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        })
    }
}





