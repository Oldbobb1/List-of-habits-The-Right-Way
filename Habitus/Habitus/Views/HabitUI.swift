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
   
        createTableView.showsVerticalScrollIndicator = false
        createTableView.translatesAutoresizingMaskIntoConstraints = false
        
        createTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        createTableView.register(TextFieldCell.self, forCellReuseIdentifier: "TextFieldCell")
        createTableView.register(DatePickerCell.self, forCellReuseIdentifier: "DatePickerCell")
        createTableView.register(DaysCell.self, forCellReuseIdentifier: "DaysCell")
        
        Layout.applyView(titleLabel, view: view, topOffset: 0.85, leadingOffset: 124, trailingOffset: -124)

        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -280)
        Layout.applyView(buttonSaveAndSendInTable, view: view, topOffset: 0, leadingOffset: 280, trailingOffset: -10)
        
        Layout.applyView(createTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
                        make.leading.trailing.bottom.equalToSuperview()

        })
        applyNeomorphism(to: buttonCloseUIView)
        applyNeomorphism(to: buttonSaveAndSendInTable)
        applyNeomorphism(to: titleLabel)
    }
    
    func applyNeomorphism(to view: UIView) {
           view.layer.shadowColor = UIColor.black.cgColor
           view.layer.shadowOffset = CGSize(width: 5, height: 5)
           view.layer.shadowOpacity = 0.2
           view.layer.shadowRadius = 10

           let innerShadowLayer = CALayer()
           innerShadowLayer.frame = view.bounds
        let shadowPath = UIBezierPath(roundedRect: innerShadowLayer.bounds.insetBy(dx: -10, dy: -10), cornerRadius: view.layer.cornerRadius)
           let innerPath = UIBezierPath(roundedRect: innerShadowLayer.bounds, cornerRadius: view.layer.cornerRadius).reversing()
           shadowPath.append(innerPath)
           innerShadowLayer.shadowPath = shadowPath.cgPath
           innerShadowLayer.masksToBounds = true
           innerShadowLayer.shadowColor = UIColor.white.cgColor
           innerShadowLayer.shadowOffset = CGSize(width: -5, height: -5)
           innerShadowLayer.shadowOpacity = 0.7
           innerShadowLayer.shadowRadius = 10
           view.layer.addSublayer(innerShadowLayer)
        
//        titleLabel.layer.shadowColor = UIColor.black.cgColor
        //        titleLabel.layer.shadowOffset = CGSize(width: -1, height: 1)
        //        titleLabel.layer.shadowOpacity = 0.5
        //        titleLabel.layer.shadowRadius = 4
        //
        //        buttonCloseUIView.layer.shadowColor = UIColor.black.cgColor
        //        buttonCloseUIView.layer.shadowOffset = CGSize(width: -1, height: -1)
        //        buttonCloseUIView.layer.shadowOpacity = 0.8
        //        buttonCloseUIView.layer.shadowRadius = 4
        //        buttonCloseUIView.setTitleShadowColor(.black, for: .normal)
        //        buttonCloseUIView.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
           
        //
        //        buttonSaveAndSendInTable.layer.shadowColor = UIColor.black.cgColor
        //        buttonSaveAndSendInTable.layer.shadowOffset = CGSize(width: -1, height: 1)
        //        buttonSaveAndSendInTable.layer.shadowOpacity = 0.4
        //        buttonSaveAndSendInTable.layer.shadowRadius = 4

       }
    
}

