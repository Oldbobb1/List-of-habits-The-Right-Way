import UIKit


extension ListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.habits.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 25
        maskLayer.borderWidth = 1
        maskLayer.borderColor = UIColor.black.cgColor
        maskLayer.backgroundColor = UIColor.black.cgColor
        
        let verticalPadding: CGFloat = 10
        let insetRect = cell.bounds.insetBy(dx: verticalPadding, dy: verticalPadding/2)
        maskLayer.frame = insetRect
        cell.layer.mask = maskLayer
        
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTrackerCell
        let object = listModel.habits[indexPath.row]
//        cell.set(object: object)
        cell.set(object: object , habitName: object.name)
        return cell
    }
        
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listModel.habits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            listModel.saveHabitData()
            toggleMessageLabelVisibility()
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let movedEmoji = listModel.habits.remove(at: sourceIndexPath.row)
//        listModel.habits.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }

}


extension ListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let calendarVC = CalendarViewController()
        calendarVC.modalPresentationStyle = .fullScreen
        present(calendarVC, animated: true, completion: nil)
    }
    
}

