//
//  table.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 9.06.24.
//

import UIKit

public class TableView {
    public  static func createNewTableView() -> UITableView {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)

        // Устанавливаем цвет и толщину разделительных линий
        tableView.separatorColor = UIColor.gray
        tableView.separatorStyle = .singleLine
        return tableView
    }
}
