//  SettingViewCOntroller.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import AuthenticationServices

class SettingViewController: UIViewController {

    let label = Label.label(text: "Setting", fontSize: 25)
    
    let nameLabel = Label.label(text: "Bobbi R.", fontSize: 18)
    let descriptionLabel = Label.label(text:"Apple ID, iCloud, контент и покупки", fontSize: 14)
    let profileImageView = createImage("guidePrew")
  
    let containerView: UIView = {
        let containerView = UIView()
//        containerView.backgroundColor = .systemBackground
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "chevron.right")
        arrowImageView.tintColor = .gray
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        return arrowImageView
    }()
    
    let stackView2 =  stack()
    let label1 = Label.label(text: "Theme", fontSize: 18)
    let switchButt = createSwitchButton(isOn: false)
    
    let button1 = createButtonWithTextAndAction(setTitle: "Support", height: 40)
    let button2 = createButtonWithTextAndAction(setTitle: "Guidance ", height: 40)
    let button3 = createButtonWithTextAndAction(setTitle: "Rate the app", height: 40)
    let button4 = createButtonWithTextAndAction(setTitle: "Subscription", height: 40)
    
    let signInWithAppleButton = ASAuthorizationAppleIDButton(type: .signIn, style: .white)
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        view.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(arrowImageView)
        
        view.addSubview(stackView2)
        stackView2.addArrangedSubview(label1)
        stackView2.addArrangedSubview(switchButt)
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(signInWithAppleButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black

        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .left
        
        label1.textAlignment = .left
        label1.textColor = .black
        stackView2.backgroundColor = .white
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.layer.cornerRadius = 10
        
        signInWithAppleButton.cornerRadius = 10
        signInWithAppleButton.semanticContentAttribute = .forceRightToLeft
    
        switchButt.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        signInWithAppleButton.addTarget(self, action: #selector(handleLogInWithAppleIDButtonPress), for: .touchUpInside)
        
        button1.addTarget(self, action: #selector(openMailApp), for: .touchUpInside)
        button2.addTarget(self, action: #selector(openGuidanceView), for: .touchUpInside)
        button3.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button4.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
       
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        
//        Layout.applyView(containerView, view: view, topOffset: 40, leadingOffset: 10,trailingOffset: -10, additionalConstraints: {make in
//            make.height.equalTo(80)
//        })
        
        containerView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.height.equalTo(80)
        }

        // Устанавливаем ограничения для profileImageView
        profileImageView.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.centerY.equalTo(containerView)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }

        // Устанавливаем ограничения для nameLabel
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(containerView.snp.top).offset(20)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }

        // Устанавливаем ограничения для descriptionLabel
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }

        // Устанавливаем ограничения для arrowImageView
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
            make.centerY.equalTo(containerView)
            make.width.equalTo(8)
            make.height.equalTo(14)
        }
        
//        Layout.applyView(stackView2, view: view, leadingOffset: 10, trailingOffset: -10 , additionalConstraints:  { make in
//            make.top.equalTo(self.label.snp.bottom).offset(156)
//            make.height.equalTo(40)
//        })
        
        stackView2.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(156) //70
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
        
        label1.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(-2)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        switchButt.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-14)
        }
        Layout.applyView(button1, view: view, topOffset: 229, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button2, view: view, topOffset: 272, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button3, view: view, topOffset: 315, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button4, view: view, topOffset: 358, leadingOffset: 10, trailingOffset: -10)
        
        signInWithAppleButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(401) //272 //358
//               make.center.equalToSuperview()
//               make.width.equalTo(400)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
        
        ThemeManager.setTheme(theme: "light")
    }
    
    @objc func openMailApp() {
        let recipient = "therromanov@gmail.com"
        let subject = "Suggestion"
        
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
            // Сменить на темную тему
            UserDefaults.standard.set("dark", forKey: "theme")
        } else {
            // Сменить на светлую тему
            UserDefaults.standard.set("light", forKey: "theme")
        }
        // Сохранить состояние переключателя
        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
        // Применить тему к приложению
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




extension SettingViewController: ASAuthorizationControllerDelegate {
    
}

extension SettingViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
}
