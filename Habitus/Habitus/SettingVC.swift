//
//  File1.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit

class SettingModel {
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                // Разрешение получено, можно сохранить это состояние
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "notificationsEnabled")
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                // Разрешение не получено
                DispatchQueue.main.async {
                    UserDefaults.standard.set(false, forKey: "notificationsEnabled")
                }
            }
        }
    }
    
}


class SettingView {

    let settingTableView = TableView.tableView(frame: .zero, style: .insetGrouped, backgroundColor: .secondarySystemBackground)
    let titleLabel = Label.label(text: "Setting", fontSize: 25, weight: .bold, textColor: nil)

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


class SettingVC: UIViewController  {
   
    var isUserLoggedIn = false, userName: String = "", userImage: UIImage?
    
    let settingView = SettingView(), settingModel = SettingModel()
    
    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?, color: UIColor)] = []
    var accountItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?, color: UIColor)] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.settingTableView.dataSource = self
        settingView.settingTableView.delegate = self
        
        settingView.initializeUI(view)
        settingModel.requestNotificationAuthorization()
        configureSettingsItems()
        
        ThemeManager.observeSystemThemeChanges()
//        ThemeManager.setTheme(theme: ThemeManager.currentTheme)
    }
    
    func configureSettingsItems() {
        settingsItems = [
            ("moon.stars.fill", "Оформление", true, nil, color: .red),
            ("bell.and.waves.left.and.right.fill", "Уведомления", true, nil,color: .red),
            ("questionmark.bubble", "Поддержка", false, { self.openMailApp()}, color: .red),
            ("text.book.closed.fill", "Гайд", false, { self.openGuidancePresentation()}, color: .red),
            ("star.square", "Оцените приложение", false, { self.showAlert()}, color: .red),
            ("dollarsign.circle.fill", "Подписка", false, { self.showAlert()}, color: .red)
        ]
        
        accountItems = [
            ("apple.logo", "Войти с Apple", false, { self.performSignInWithApple() }, color: .red),
            ("icloud.and.arrow.up", "Резервное копирование", false, { }, color: .green),
            ("arrowshape.turn.up.left", "Выйти", false, {}, color: .blue)
        ]
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        let index = sender.tag
        
        if index == 0 {
            let theme = sender.isOn ? "dark" : "light"
            UserDefaults.standard.set(theme, forKey: "theme")
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
            }
        } else if index == 1 {
            // Код для показа алерта и установки уведомлений
            let notificationsEnabled = sender.isOn
            UserDefaults.standard.set(notificationsEnabled, forKey: "notificationsEnabled")
            if notificationsEnabled {
                UIApplication.shared.registerForRemoteNotifications()
            } else {
                UIApplication.shared.unregisterForRemoteNotifications()
            }
            let message = notificationsEnabled ? "Уведомления включены" : "Уведомления выключены"
            let alert = UIAlertController(title: "Уведомление", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
            self.present(alert, animated: true, completion: nil)
        }
        // Сохранение состояния переключателя
        UserDefaults.standard.set(sender.isOn, forKey: "switchState\(index)")
    }
    
    func showAlert() {
          let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alertController, animated: true, completion: nil)
      }

    func openGuidancePresentation() {
          let guidanceVC = GuidanceVC()
          let navigat = UINavigationController(rootViewController: guidanceVC)
          navigat.modalPresentationStyle = .fullScreen
          self.present(navigat,animated: true, completion: nil)
      }
      
      func openMailApp() {
          let recipient = "therromanov@gmail.com", subject = "Suggestion"
          if let url = URL(string: "mailto:\(recipient)?subject=\(subject)") {
              UIApplication.shared.open(url)
          }
      }

    
    func performSignInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

}


class ProfileTableViewCell: UITableViewCell {
    
    let profileImageView = Image.image("person.circle.fill", cornerRadius: 35, contentMode: .scaleAspectFill)
    let profileLabel = Label.label(text: "", fontSize: 18, weight: .medium, textColor: .label)
    let profileSubtitleLabel = Label.label(text: "", fontSize: 14, weight: .regular, textColor: .gray)
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(profileLabel)
        contentView.addSubview(profileSubtitleLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
    
        profileLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(contentView.snp.top).offset(16)
//            make.trailing.equalTo(profileArrowImageView.snp.leading).offset(-16)
        }
    
        profileSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(profileLabel.snp.bottom).offset(4)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-16) // Добавлено ограничение по нижней границе
        }
        
//        profileSubtitleLabel.snp.makeConstraints { make in
//            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
//            make.top.equalTo(profileLabel.snp.bottom).offset(4)
////            make.trailing.equalTo(profileArrowImageView.snp.leading).offset(-16)
//        }
 
//        contentView.snp.makeConstraints { make in
//            make.height.equalTo(80)
////            make.leading.equalTo(0.5)
////            make.trailing.equalTo(-0.5)
//        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(profileImage: UIImage?, name: String, subtitle: String) {
        profileImageView.image = profileImage
        profileLabel.text = name
        profileSubtitleLabel.text = subtitle
    }
    
}


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



extension SettingVC: UITableViewDelegate {
   
}


import AuthenticationServices

extension SettingVC: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization failed: \(error.localizedDescription)")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Handle successful authorization
            isUserLoggedIn = true
            userName = appleIDCredential.fullName?.givenName ?? "User"
            userImage = UIImage(systemName: "person.fill") // Replace with actual image if available
            settingView.settingTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
        }
    }
    
}

extension SettingVC: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
        
    }
}
