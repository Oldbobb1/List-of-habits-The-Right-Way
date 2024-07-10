//  SettingViewUI.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class SettingViewUI {
    
    let titleLabel = Label.label(text: "Setting", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center)
    let settingTableView = TableView.tableView(frame: .zero, style: .insetGrouped, backgroundColor: .clear)
    
    func initializeUI(_ view: UIView) {
        view.addSubview(titleLabel)
        view.addSubview(settingTableView)
        
        settingTableView.translatesAutoresizingMaskIntoConstraints = false
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(settingTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
        })
    }
}
