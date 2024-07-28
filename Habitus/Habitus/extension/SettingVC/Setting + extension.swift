import UIKit

extension SettingVC {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        let index = sender.tag
        if index == 0 {
            if sender.isOn {
                UserDefaults.standard.set("dark", forKey: "theme")
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .dark
                }
            } else {
                UserDefaults.standard.removeObject(forKey: "theme")
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .unspecified
                }
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
