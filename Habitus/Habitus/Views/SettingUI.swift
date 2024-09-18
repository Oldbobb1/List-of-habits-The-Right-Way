import UIKit
import ElementBuilder


class SettingUI {
    
    let titleLabel = Label.label(text: "Setting", fontSize: 28, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let settingTableView = UITableView(frame: .zero, style: .insetGrouped)
        
    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(settingTableView)
        
        setupView(view)
        layout(view)
        
//        settingTableView.frame = .zero
    }
    
    func setupView(_ view: UIView) {
        settingTableView.translatesAutoresizingMaskIntoConstraints = false
//        settingTableView.backgroundColor = .systemBackground
//       
        settingTableView.showsVerticalScrollIndicator = false
//        settingTableView.layer.borderWidth = 1
        settingTableView.layer.cornerRadius = 25
//        settingTableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
//        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        settingTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        settingTableView.register(SetupCell.self, forCellReuseIdentifier: "setupCell")
        settingTableView.register(SetupCell1.self, forCellReuseIdentifier: "setupCell1")
        settingTableView.register(SetupCell2.self, forCellReuseIdentifier: "setupCell2")
        settingTableView.register(SetupCell3.self, forCellReuseIdentifier: "setupCell3")
        settingTableView.register(SetupCell4.self, forCellReuseIdentifier: "setupCell4")

        

    }
    
    func layout(_ view: UIView) {
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(settingTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        })
    }
}
