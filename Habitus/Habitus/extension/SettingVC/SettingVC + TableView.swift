import UIKit


extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3,4,5:
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
        //        
        switch indexPath.section {
        case 0:
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            let profileImage = isUserLoggedIn ? userImage : UIImage(systemName: "person.circle")
            let profileName = isUserLoggedIn ? userName : "?"
            profileCell.configure(profileImage: profileImage, name: profileName, subtitle: "?")
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
            cell.view = self
            return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell2", for: indexPath) as! SetupCell2
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell3", for: indexPath) as! SetupCell3
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
//            cell.isHidden = true 
                return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "setupCell4", for: indexPath) as! SetupCell4
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
            // При удачном входе
//            cell.updateButton(isLoggedIn: true)
            // Если пользователь не вошёл в систему
//            cell.updateButton(isLoggedIn: false)
            return cell
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
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return indexPath // Отключаем выбор для первой ячейки
        }
        return nil // Включаем выбор для остальных ячеек
    }

}

extension SettingVC: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let alertController = UIAlertController(title: " Sing in Account", message: nil, preferredStyle: .actionSheet)
//        
//        let option1 = UIAlertAction(title: " Sign in Apple", style: .default) { _ in
////            print("Месячная подписка выбрана")
//        }
////        let option2 = UIAlertAction(title: "Годовая подписка", style: .default) { _ in
////            print("Годовая подписка выбрана")
////        }
////        let option3 = UIAlertAction(title: "Покупка приложения", style: .default) { _ in
////            print("Пожизненная подписка выбрана")
////        }
//        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        
//        alertController.addAction(option1)
////        alertController.addAction(option2)
////        alertController.addAction(option3)
//        alertController.addAction(cancelAction)
//        
//        self.present(alertController, animated: true, completion: nil)
//        
//    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        
//        // Создаем атрибутированный заголовок
//        let titleFont = UIFont.systemFont(ofSize: 18)
//        let titleText = " Sign in with Apple"
//        
//        let imageAttachment = NSTextAttachment()
//        imageAttachment.image = UIImage(systemName: "apple.logo")?.withRenderingMode(.alwaysTemplate) // Используем системную иконку
//        let imageString = NSAttributedString(attachment: imageAttachment)
//        
//        let textString = NSAttributedString(string: titleText, attributes: [.font: titleFont])
//        
//        let attributedTitle = NSMutableAttributedString()
//        attributedTitle.append(imageString)
//        attributedTitle.append(textString)
//        
//        alertController.setValue(attributedTitle, forKey: "attributedTitle")
//        
//        let option1 = UIAlertAction(title: "Sign in", style: .default) { _ in
//            // Действие при выборе
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        
//        alertController.addAction(option1)
//        alertController.addAction(cancelAction)
//        
//        self.present(alertController, animated: true, completion: nil)
//    }
    
}
    
    





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
