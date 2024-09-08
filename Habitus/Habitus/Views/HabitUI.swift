import  UIKit
import ElementBuilder


class HabitUI {

    let titleLabel = Label.label(text: "New Habit", fontSize: 25, weight: .bold, textColor: nil,textAlignment: .center, backgroundColor: .systemBackground,clipsToBounds: false)
//cornerRadius: 16
//    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Cancel",cornerRadius: 15,setTitleColor: .systemGray, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    // 28 - 28 // 38 - 38
    let buttonCloseUIView = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"x.circle.fill", setImage: nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4)
    
//    let buttonSaveAndSendInTable = ButtonsWithAction.makeButton(setTitle: "Save", cornerRadius: 15, setTitleColor: .systemGray,clipsToBounds: false,backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let buttonSaveAndSendInTable = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"paperplane.circle.fill", setImage: nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4)
    
    let createTableView = UITableView(frame: .zero, style: .insetGrouped)
    
//    let selectedColorView: UIView = {
//        let col = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
//        col.layer.cornerRadius = 15
//        col.translatesAutoresizingMaskIntoConstraints = false
//        col.backgroundColor = .systemGray6
//        return col
//    }()
    
    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(buttonCloseUIView)
        view.addSubview(buttonSaveAndSendInTable)
        view.addSubview(createTableView)
//        view.addSubview(selectedColorView)
        
        layout(view)
        setupView(view)
    }
    
    func setupView(_ view: UIView) {
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        createTableView.backgroundColor = .systemBackground
        createTableView.showsVerticalScrollIndicator = false
        createTableView.layer.cornerRadius = 15

        createTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        createTableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        createTableView.register(DatePickerCell.self, forCellReuseIdentifier: "DatePickerCell")
        createTableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")
        createTableView.register(TexеCell.self, forCellReuseIdentifier: "TexеCell")
        
//        buttonCloseUIView.tintColor = .white
    }
    
    func layout(_ view: UIView) {
        Layout.applyView(titleLabel, view: view, topOffset: 0.85, leadingOffset: 10, trailingOffset: -10)
        
//        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -280)
       
        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 20, additionalConstraints: {make in
//            make.width.equalTo(100)
//            make.width.equalTo(35)
        })

//        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0, leadingOffset: 280, trailingOffset: -10)
        
        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0, trailingOffset: -20, additionalConstraints: {make in
//            make.width.equalTo(100)
        })
        
        Layout.applyView(createTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            make.leading.trailing.bottom.equalToSuperview()
        })
    }
}





