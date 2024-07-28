import UIKit
import ElementBuilder


class SettingUI {
    
    let titleLabel = Label.label(text: "Setting", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let settingTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    func initializeUI(_ view: UIView) {
        
        view.addSubview(titleLabel)
        view.addSubview(settingTableView)
        
        setupView(view)
        layout(view)
        
        settingTableView.frame = .zero
    }
    
    func setupView(_ view: UIView) {
        
        settingTableView.translatesAutoresizingMaskIntoConstraints = false
        settingTableView.backgroundColor = .systemBackground
        settingTableView.showsVerticalScrollIndicator = false
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
    }
    
    func layout(_ view: UIView) {
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(settingTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        })
    }
}
