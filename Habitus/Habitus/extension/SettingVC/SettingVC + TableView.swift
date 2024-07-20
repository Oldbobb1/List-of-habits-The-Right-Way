import UIKit


extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return settingsItems.count
        case 2:
            return isUserLoggedIn ? accountItems.count : 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            let profileImage = isUserLoggedIn ? userImage : UIImage(systemName: "person.circle.fill")
            let profileName = isUserLoggedIn ? userName : "Sign In"
            cell.configure(profileImage: profileImage, name: profileName, subtitle: "Apple ID, Icloud")
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let (imageName, title, hasSwitch, _, _) = settingsItems[indexPath.row]
            
            //            cell.backgroundColor = .blue
            //            cell.layer.borderWidth = 1
            //            cell.layer.borderColor = UIColor.white.cgColor
            
            if let image = UIImage(systemName: imageName) {
                cell.imageView?.image = image
            } else if let customImage = UIImage(named: imageName) {
                cell.imageView?.image = customImage
            } else {
                cell.imageView?.image = UIImage(systemName: "questionmark.circle")
            }
            //            cell.imageView?.tintColor = color
            // Title
            cell.textLabel?.text = title
            cell.textLabel?.font = .systemFont(ofSize: 17)
            //            cell.textLabel?.textColor = color
            
            if (hasSwitch) {
                let switchView = UISwitch(frame: .zero)
                switchView.tag = indexPath.row // Установка тега для различения переключателей
                switchView.setOn(UserDefaults.standard.bool(forKey: "switchState\(indexPath.row)"), animated: false)
                switchView.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
                cell.accessoryView = switchView
                cell.selectionStyle = .none
            } else {
                cell.accessoryType = .disclosureIndicator
            }
//            cell.backgroundColor = .clear
//            cell.tintColor = .systemOrange
//    
//              cell.layer.shadowColor = UIColor.systemOrange.cgColor
//              cell.layer.shadowOffset = CGSize(width: 0, height: 2)
//              cell.layer.shadowRadius = 2
//            cell.layer.shadowOpacity = 0.7
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let (imageName, title, _, _, _) = accountItems[indexPath.row]
            
            if let image = UIImage(systemName: imageName) {
                cell.imageView?.image = image
            } else if let customImage = UIImage(named: imageName) {
                cell.imageView?.image = customImage
            } else {
                cell.imageView?.image = UIImage(systemName: "questionmark.circle")
            }
            //            cell.imageView?.tintColor = color
            cell.textLabel?.text = title
            cell.textLabel?.font = .systemFont(ofSize: 17)
            cell.textLabel?.textAlignment = .left
            //            cell.textLabel?.textColor = color
            
            if title == "Войти с Apple" && !isUserLoggedIn {
                cell.accessoryType = .none // Убираем chevron.right для "Войти с Apple"
            } else if title == "Войти с Apple" && isUserLoggedIn {
                cell.isHidden = true // Скрываем ячейку "Войти с Apple" при авторизации
            } else {
                cell.accessoryType = .disclosureIndicator
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 1:
            let (_, _, _, action, _) = settingsItems[indexPath.row]
            action?()
        case 2:
            let (_, _, _, action, _) = accountItems[indexPath.row]
            action?()
        default:
            break
        }
    }
    
}


extension SettingVC: UITableViewDelegate { }




