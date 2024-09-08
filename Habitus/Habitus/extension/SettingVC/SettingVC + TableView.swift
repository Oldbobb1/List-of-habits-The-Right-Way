import UIKit


extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3:
            //        case 0,1,2,3,4:
            return 1
        default:
            return 0
        }
    }
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        
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
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "setupCell", for: indexPath) as! SetupCell
            cell1.selectionStyle = .none
            cell1.backgroundColor = .clear
            cell1.views = self
//            switchView.tag = indexPath.row // Установка тега для различения переключателей
//            switchButton.setOn(UserDefaults.standard.bool(forKey: "switchState\(indexPath.row)"), animated: false)
//            switchButton.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
//            switchButton.accessoryView = switchView
//                       cell1.selectionStyle = .none
            
                        return cell1
                    case 2:
                        let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell1", for: indexPath) as! SetupCell1
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
                        return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell2", for: indexPath) as! SetupCell2
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
                return cell
            //case 4:
            //    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
            //    return cell
            //        default:
            //            return UITableViewCell()
            //        }
        default:
            return UITableViewCell()
        }
        
        //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        //        
        //        switch indexPath.section {
        //        case 1:
        //            let (_, _, _, action ) = settingsItems[indexPath.row]
        //            action?()
        //        case 2:
        //            let (_, _, _, action) = accountItems[indexPath.row]
        //            action()
        //        default:
        //            break
        //        }
        //    }
    }
}

extension SettingVC: UITableViewDelegate { }






//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//    switch indexPath.section {
//    case 0:
//        let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
//        let profileImage = isUserLoggedIn ? userImage : UIImage(systemName: "person.circle.fill")
//        let profileName = isUserLoggedIn ? userName : "Sign In"
//        profileCell.configure(profileImage: profileImage, name: profileName, subtitle: "Apple ID, Icloud")
//        profileCell.backgroundColor = .systemGray6
//        profileCell.selectionStyle = .none
//        return profileCell
//    case 1:
//        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let (imageName, title, hasSwitch, _) = settingsItems[indexPath.row]
//
//        if let image = UIImage(systemName: imageName) {
//            cell1.imageView?.image = image
//            cell1.imageView?.tintColor = .red
//            
//        } else if let customImage = UIImage(named: imageName) {
//            cell1.imageView?.image = customImage
//        } else {
//            cell1.imageView?.image = UIImage(systemName: "questionmark.circle")
//        }
//        
//        cell1.textLabel?.text = title
//        cell1.textLabel?.font = .systemFont(ofSize: 17)
//        
//        if (hasSwitch) {
//            let switchView = UISwitch(frame: .zero)
//            switchView.tag = indexPath.row // Установка тега для различения переключателей
//            switchView.setOn(UserDefaults.standard.bool(forKey: "switchState\(indexPath.row)"), animated: false)
//            switchView.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
//            cell1.accessoryView = switchView
//            cell1.selectionStyle = .none
//            
//        } else {
//            cell1.accessoryType = .disclosureIndicator
//        }
//        cell1.backgroundColor = .clear
//        
//        return cell1
//    case 2:
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let (imageName, title, _, _) = accountItems[indexPath.row]
//        
//      
//        if let image = UIImage(systemName: imageName) {
//            cell.imageView?.image = image
//            
//            cell.imageView?.tintColor = .red
//            
//        } else if let customImage = UIImage(named: imageName) {
//            cell.imageView?.image = customImage
//        } else {
//            cell.imageView?.image = UIImage(systemName: "questionmark.circle")
//        }
//        
//        cell.textLabel?.text = title
//        cell.textLabel?.font = .systemFont(ofSize: 17)
//        cell.textLabel?.textAlignment = .left
//      
//
//        if title == "Войти с Apple" && !isUserLoggedIn {
//            cell.accessoryType = .none // Убираем chevron.right для "Войти с Apple"
//        } else if title == "Войти с Apple" && isUserLoggedIn {
//            cell.isHidden = true // Скрываем ячейку "Войти с Apple" при авторизации
//        } else {
//            cell.accessoryType = .disclosureIndicator
//        }
//        cell.backgroundColor = .clear
//        return cell
//    default:
//        return UITableViewCell()
//    }
//}


//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    switch section {
//    case 0:
//        return 1
//    case 1:
//        return settingsItems.count
//    case 2:
//        return isUserLoggedIn ? accountItems.count : 1
//    default:
//        return 0
//    }
//}
