import SwiftUI
import UIKit
import AuthenticationServices


class SettingVC: UIViewController  {
    
    var isUserLoggedIn = false
    var userName: String = ""
    var userImage: UIImage?
    
    let settingView = SettingUI()
    let settingModel = SettingModel()
    
    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
    
    var accountItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void))] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.settingTableView.dataSource = self
        settingView.settingTableView.delegate = self
        
        settingView.initializeUI(view)
        settingModel.requestNotificationAuthorization()
        configureSettingsItems()
        
//        ThemeManager.observeSystemThemeChanges()
    }
    
    func configureSettingsItems() {
        
        settingsItems = [
            ("moon.stars.fill", "Оформление", true, nil),
            ("bell.and.waves.left.and.right.fill", "Уведомления", true, nil),
            ("questionmark.bubble", "Поддержка", false, { self.openMailApp()}),
            ("text.book.closed.fill", "Гайд", false, { self.openGuidancePresentation()}),
            ("star.square", "Оцените приложение", false, { self.showAlert()}),
            ("dollarsign.circle.fill", "Подписка", false, { self.openSubscribeVC()})
        ]
        accountItems = [
            ("apple.logo", "Войти с Apple", false, { self.signInWithApple() }),
            ("icloud.and.arrow.up", "Резервное копирование", false, {self.backup()}),
            ("arrowshape.turn.up.left", "Выйти", false, {self.logout()})
        ]
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




struct ViewControllerProvider3: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SettingVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
