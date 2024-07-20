import UIKit
import ElementBuilder


class SettingUI {
    
    let titleLabel = Label.label(text: "Setting", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    let settingTableView = TableView.tableView(frame: .zero, style: .insetGrouped, backgroundColor: .systemBackground)
    
    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(settingTableView)
        
//       profileLabel.layer.cornerRadius = 10
//        titleLabel.layer.shadowColor = UIColor.black.cgColor
//        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
//        titleLabel.layer.shadowOpacity = 0.6
//        titleLabel.layer.shadowRadius = 4
        
        settingTableView.translatesAutoresizingMaskIntoConstraints = false
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(settingTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        })
    }
    
}
