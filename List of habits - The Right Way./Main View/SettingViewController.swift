//  SettingViewCOntroller.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import AuthenticationServices

class SettingViewController: UIViewController {
    
    var setting: SettingModel!, switchButt = UISwitch(), signInWithAppleButton = ASAuthorizationAppleIDButton()
    var button1 = UIButton(), button2 = UIButton(), button3 = UIButton(), button4 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting = SettingModel()
        setting.updateUI(view: self.view)
        setting.setupUI()
        
        switchButt = setting.switchButt
        signInWithAppleButton = setting.signInWithAppleButton
        button1 = setting.button1
        button2 = setting.button2
        button3 = setting.button3
        button4 = setting.button4
        
        buttonAction()
        saveSwitch()
    }
    
    func saveSwitch() {
        if let switchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
            switchButt.isOn = switchState
        }
    }
    
    private func buttonAction() {
        switchButt.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        signInWithAppleButton.addTarget(self, action: #selector(handleLogInWithAppleIDButtonPress), for: .touchUpInside)
        button1.addTarget(self, action: #selector(openMailApp), for: .touchUpInside)
        button2.addTarget(self, action: #selector(openGuidanceView), for: .touchUpInside)
        button3.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button4.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func openMailApp() {
        let recipient = "therromanov@gmail.com", subject = "Suggestion"
        if let url = URL(string: "mailto:\(recipient)?subject=\(subject)") {
            UIApplication.shared.open(url)
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
    
    @objc private func handleLogInWithAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}
