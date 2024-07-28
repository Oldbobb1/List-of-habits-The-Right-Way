import UIKit


extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
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
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            let profileImage = isUserLoggedIn ? userImage : UIImage(systemName: "person.circle.fill")
            let profileName = isUserLoggedIn ? userName : "Sign In"
            profileCell.configure(profileImage: profileImage, name: profileName, subtitle: "Apple ID, Icloud")
            profileCell.backgroundColor = .clear
            profileCell.selectionStyle = .none
            return profileCell
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let (imageName, title, hasSwitch, _) = settingsItems[indexPath.row]
  
            if let image = UIImage(systemName: imageName) {
                cell1.imageView?.image = image
//                cell1.imageView?.tintColor = .green
                
                cell1.imageView?.backgroundColor = .systemGray6
                cell1.imageView?.layer.cornerRadius = 5
                cell1.imageView?.layer.masksToBounds = false
                cell1.imageView?.tintColor = .red
                cell1.imageView?.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
                cell1.imageView?.layer.shadowOffset = CGSize(width: 0, height: 2)
                cell1.imageView?.layer.shadowOpacity = 1
                cell1.imageView?.layer.shadowRadius = 4
                
            } else if let customImage = UIImage(named: imageName) {
                cell1.imageView?.image = customImage
            } else {
                cell1.imageView?.image = UIImage(systemName: "questionmark.circle")
            }
            
            cell1.textLabel?.text = title
            cell1.textLabel?.font = .systemFont(ofSize: 17)
//            cell1.textLabel?.textColor = .red

            cell1.textLabel?.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
            cell1.textLabel?.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell1.textLabel?.layer.shadowOpacity = 1
            cell1.textLabel?.layer.shadowRadius = 4
         
            if (hasSwitch) {
                let switchView = UISwitch(frame: .zero)
                switchView.tag = indexPath.row // Установка тега для различения переключателей
                switchView.setOn(UserDefaults.standard.bool(forKey: "switchState\(indexPath.row)"), animated: false)
                switchView.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
                cell1.accessoryView = switchView
                cell1.selectionStyle = .none
                
                switchView.backgroundColor = .systemGray6
                switchView.layer.cornerRadius = 15
                switchView.layer.masksToBounds = false
                switchView.layer.shadowColor = UIColor.black.cgColor
                switchView.layer.shadowOffset = CGSize(width: 0, height: 2)
                switchView.layer.shadowOpacity = 1
                switchView.layer.shadowRadius = 4
                
            } else {
                cell1.accessoryType = .disclosureIndicator
            }
            cell1.backgroundColor = .clear
            
            return cell1
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let (imageName, title, _, _) = accountItems[indexPath.row]
            
          
            if let image = UIImage(systemName: imageName) {
                cell.imageView?.image = image
                
                cell.imageView?.backgroundColor = .systemGray6
                cell.imageView?.layer.cornerRadius = 5
                cell.imageView?.layer.masksToBounds = false
                cell.imageView?.tintColor = .red
                cell.imageView?.layer.shadowColor = UIColor.black.cgColor
                cell.imageView?.layer.shadowOffset = CGSize(width: 0, height: 2)
                cell.imageView?.layer.shadowOpacity = 0.2
                cell.imageView?.layer.shadowRadius = 4
                
            } else if let customImage = UIImage(named: imageName) {
                cell.imageView?.image = customImage
            } else {
                cell.imageView?.image = UIImage(systemName: "questionmark.circle")
            }
            
            cell.textLabel?.text = title
            cell.textLabel?.font = .systemFont(ofSize: 17)
            cell.textLabel?.textAlignment = .left
          

            if title == "Войти с Apple" && !isUserLoggedIn {
                cell.accessoryType = .none // Убираем chevron.right для "Войти с Apple"
            } else if title == "Войти с Apple" && isUserLoggedIn {
                cell.isHidden = true // Скрываем ячейку "Войти с Apple" при авторизации
            } else {
                cell.accessoryType = .disclosureIndicator
            }
            cell.backgroundColor = .clear
            return cell
        default:
            return UITableViewCell()
        }
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 1:
            let (_, _, _, action ) = settingsItems[indexPath.row]
            action?()
        case 2:
            let (_, _, _, action) = accountItems[indexPath.row]
            action()
        default:
            break
        }
    }
    
}


extension SettingVC: UITableViewDelegate { }




