//  SettingVC.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit
import AuthenticationServices

class SettingVC: UIViewController  {
    
    var isUserLoggedIn = false, userName: String = "", userImage: UIImage?
    
    let settingView = SettingViewUI(), settingModel = SettingModel()
    
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
            ("dollarsign.circle.fill", "Подписка", false, { self.openSubscribeVC()}, color: .red)
        ]
        accountItems = [
            ("apple.logo", "Войти с Apple", false, { self.signInWithApple() }, color: .red),
            ("icloud.and.arrow.up", "Резервное копирование", false, {self.backup()}, color: .green),
            ("arrowshape.turn.up.left", "Выйти", false, {self.logout()}, color: .blue)
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
    
    func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
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







