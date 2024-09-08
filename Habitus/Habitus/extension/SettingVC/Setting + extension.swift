import UIKit


extension SettingVC {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

//    func requestNotificationAuthorization(completion: @escaping (Bool) -> Void) {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
//            DispatchQueue.main.async {
//                if granted {
//                    UserDefaults.standard.set(true, forKey: "notificationsEnabled")
//                    UIApplication.shared.registerForRemoteNotifications()
//                } else {
//                    UserDefaults.standard.set(false, forKey: "notificationsEnabled")
//                }
//                completion(granted)
//            }
//        }
//    }
//    
//    @objc func switchValueChanged(_ sender: UISwitch) {
//        let index = sender.tag
//        if index == 0 {
//            if sender.isOn {
//                UserDefaults.standard.set("dark", forKey: "theme")
//                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                   let window = windowScene.windows.first {
//                    window.overrideUserInterfaceStyle = .dark
//                }
//            } else {
//                UserDefaults.standard.removeObject(forKey: "theme")
//                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                   let window = windowScene.windows.first {
//                    window.overrideUserInterfaceStyle = .unspecified
//                }
//            }
//        } else if index == 1 {
//            if sender.isOn {
//                requestNotificationAuthorization { granted in
//                    if !granted {
//                        self.showAuthorizationAlert(sender: sender)
//                    } else { }
//                }
//            } else {
//                UserDefaults.standard.set(false, forKey: "notificationsEnabled")
//                UIApplication.shared.unregisterForRemoteNotifications()
//            }
//        }
//        UserDefaults.standard.set(sender.isOn, forKey: "switchState\(index)")
//    }
//    
//    private func showAuthorizationAlert(sender: UISwitch) {
//        let alert = UIAlertController(title: "Уведомления отключены", message: "Для включения уведомлений, пожалуйста, разрешите их в настройках.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
//            sender.setOn(false, animated: true)
//        }))
//        alert.addAction(UIAlertAction(title: "Настройки", style: .default, handler: { _ in
//            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
//                UIApplication.shared.open(appSettings)
//            }
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }

    func openSubscribeVC() {
        let sub = SubscribeVC()
        let nav = UINavigationController(rootViewController: sub)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
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
    
    func logout() {
        isUserLoggedIn = false
        userName = ""
        userImage = nil
        settingView.settingTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
    }
    
    func backup() {
        // Implement backup logic here
        showAlert()
    }
}
