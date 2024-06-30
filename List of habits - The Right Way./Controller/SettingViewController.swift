//  SettingViewCOntroller.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import AuthenticationServices

class SettingViewController: UIViewController {
    
    var settingView = SettingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
//                ThemeManager.observeSystemThemeChanges()
//        ThemeManager.setTheme(theme: ThemeManager.currentTheme)
        
    }
    
    func setup() {
        settingView.updateUI(view)
        settingView.switchButt.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        settingView.button1.addTarget(self, action: #selector(openMailApp), for: .touchUpInside)
        settingView.button2.addTarget(self, action: #selector(openGuidanceView), for: .touchUpInside)
        settingView.button3.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        settingView.button4.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        settingView.signInWithAppleButton.addTarget(self, action: #selector(handleLogInWithAppleIDButtonPress), for: .touchUpInside)
        saveSwitch(switchButt: settingView.switchButt)
    }
    
    @objc func openMailApp() {
        let recipient = "therromanov@gmail.com", subject = "Suggestion"
        if let url = URL(string: "mailto:\(recipient)?subject=\(subject)") {
            UIApplication.shared.open(url)
        }
    }
    
    func saveSwitch(switchButt: UISwitch) {
        if let switchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
            switchButt.isOn = switchState
        }
    }
    
    @objc func openGuidanceView(_ sender:UIButton) {
        let new = GuidanceViewControllers()
        let navigat = UINavigationController(rootViewController: new)
        navigat.modalPresentationStyle = .fullScreen
        self.present(navigat,animated: true, completion: nil)
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set("dark", forKey: "theme")
        } else {
            UserDefaults.standard.set("light", forKey: "theme")
        }
        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        }
    }
 
    @objc func handleLogInWithAppleIDButtonPress() {
//        if #available(iOS 16.0, *){
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
//        }
    }
}

