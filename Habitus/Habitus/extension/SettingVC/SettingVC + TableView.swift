import UIKit


extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3,4:
            //        case 0,1,2,3,4:
            return 1
        default:
            return 0
        }
    }
    //    MARK: - установка отступа
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5 // Укажите нужную высоту отступа
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear // Прозрачный фон
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            let profileImage = isUserLoggedIn ? userImage : UIImage(systemName: "person.circle")
            let profileName = isUserLoggedIn ? userName : "?"
            profileCell.configure(profileImage: profileImage, name: profileName, subtitle: "?")
            profileCell.backgroundColor = .clear
            profileCell.selectionStyle = .none
            profileCell.views = self
            return profileCell
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "setupCell", for: indexPath) as! SetupCell
            cell1.selectionStyle = .none
            cell1.backgroundColor = .clear
            cell1.views = self
            return cell1
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell1", for: indexPath) as! SetupCell1
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.views = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell2", for: indexPath) as! SetupCell2
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.views = self
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell3", for: indexPath) as! SetupCell3
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return indexPath // Отключаем выбор для первой ячейки
        }
        return nil // Включаем выбор для остальных ячеек
    }
    
}


extension SettingVC: UITableViewDelegate { }



