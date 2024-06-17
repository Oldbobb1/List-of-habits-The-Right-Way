//  table.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 9.06.24.

import UIKit

public class TableView {
    public  static func createNewTableView() -> UITableView {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
}
