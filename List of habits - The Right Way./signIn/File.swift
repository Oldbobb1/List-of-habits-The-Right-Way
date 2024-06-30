//
//  File.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 24.06.24.
//

import UIKit
import AuthenticationServices


class ModelView {
    
    let label = Label.label(text: "Setting", fontSize: 20)
    
    let firstNameLabel = Label.label(text: "", fontSize: 18)
    let lastNameLabel = Label.label(text:"", fontSize: 14)
    
    let containerView: UIView = {
        let containerView = UIView()
        //        containerView.backgroundColor = .systemBackground
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.layer.borderWidth = 1
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
    
    let userImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "person.circle")
        arrowImageView.layer.cornerRadius = 30 // Исправлено значение для радиуса
        arrowImageView.clipsToBounds = true
//        arrowImageView.tintColor = .gray
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        return arrowImageView
    }()
    
    let stackView = StackView.stack()
    let label1 = Label.label(text: "Theme", fontSize: 18)
    let switchButt = ButtonsWithAction.createSwitchButton(isOn: false)
    
    let button1 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Support", height: 40)
    let button2 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Guidance ", height: 40)
    let button3 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Rate the app", height: 40)
    let button4 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Subscription", height: 40)
    let button5 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Backup copy", height: 40)
    let signOutButton = ButtonsWithAction.createButtonWithdAction(setTitle: "Sign Out", height: 40)
    var signInWithAppleButton = ASAuthorizationAppleIDButton()

    
    func updateUI(_ view:UIView) {
        
        view.addSubview(label)
        view.addSubview(containerView)
        containerView.addSubview(firstNameLabel)
               containerView.addSubview(lastNameLabel)
               containerView.addSubview(userImageView)
               containerView.addSubview(arrowImageView)
 
        
               view.addSubview(stackView)
               stackView.addArrangedSubview(label1)
               stackView.addArrangedSubview(switchButt)
       
               view.addSubview(button1)
               view.addSubview(button2)
               view.addSubview(button3)
               view.addSubview(button4)
               view.addSubview(button5)
       
               view.addSubview(containerView)
               view.addSubview(signOutButton)
        view.addSubview(signInWithAppleButton)
               
        label1.textAlignment = .left
        signOutButton.contentHorizontalAlignment = .center
        signOutButton.layer.cornerRadius = 10
        signOutButton.layer.borderWidth = 1
        button5.layer.cornerRadius = 10
        button5.layer.borderWidth = 1
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 1
        
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10)
       

        containerView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(40)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(80)
        }
        userImageView.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.centerY.equalTo(containerView)
            make.width.equalTo(20)
            make.height.equalTo(40)
        }
    
        firstNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(userImageView.snp.trailing).offset(16)
            make.top.equalTo(containerView.snp.top).offset(20)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }

        lastNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(userImageView.snp.trailing).offset(16)
            make.top.equalTo(firstNameLabel.snp.bottom).offset(4)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }

        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
            make.centerY.equalTo(containerView)
            make.width.equalTo(8)
            make.height.equalTo(14)
        }
        
        Layout.applyView(stackView, view: view, leadingOffset: 10, trailingOffset: -10 , additionalConstraints:  { make in
            make.top.equalTo(self.containerView.snp.bottom).offset(35)
            make.height.equalTo(40)
        })
        
        Layout.applyView(label1, view: view, leadingOffset: 20, additionalConstraints:  {make in
            make.top.equalToSuperview().offset(-2)
        })
        
        Layout.applyView(switchButt, view: view, trailingOffset: -14, additionalConstraints:  {make in
            make.top.equalToSuperview().offset(4)
        })
        
        Layout.applyView(button1, view: view, topOffset: 230, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button2, view: view, topOffset: 280, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button3, view: view, topOffset: 330, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button4, view: view, topOffset: 380, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button5, view: view, topOffset: 430, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(signInWithAppleButton, view: view, topOffset: 430, leadingOffset: 10, trailingOffset: -10  ,additionalConstraints: { make in
                       make.height.equalTo(40)
                   })

        Layout.applyView(signOutButton, view: view, topOffset: 480, leadingOffset: 10, trailingOffset: -10)

    }
    
}



class LoginViewController: UIViewController {
    
    var userId: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var userImage: UIImage?

//    let userIdLabel = UILabel()
    
    var signInWithAppleButton = ASAuthorizationAppleIDButton()
 
    var login = ModelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureSignOutButton()
    }
    
    func setupUI() {
        login.updateUI(view)
        
        view.backgroundColor = .white

//        view.addSubview(userIdLabel)

        login.signOutButton.addTarget(self, action: #selector(handleSignOut), for: .touchUpInside)
        login.signInWithAppleButton.addTarget(self, action: #selector(handleLogInWithAppleIDButtonPress), for: .touchUpInside)
        
        updateUI(isLoggedIn: false)
    }
    
    func configureSignOutButton() {
        login.signOutButton.isHidden = true
        login.button5.isHidden = true
    }
    
    @objc func handleLogInWithAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    @objc func handleSignOut() {
////        self.userId = ""
//        self.firstName = ""
//        self.lastName = ""
////        self.email = ""
//        self.userImage = nil
//        updateUI(isLoggedIn: false)
        showAlert()
    }
    
    func showAlert() {
          let alert = UIAlertController(title: "Уведомление", message: "Вы уверены, что хотите выйти?", preferredStyle: .alert)
          
          alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
              // Действие при нажатии на "Ок"
              self.firstName = ""
              self.lastName = ""
              self.userImage = nil
              self.updateUI(isLoggedIn: false)
          }))
          
          alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
          
          self.present(alert, animated: true, completion: nil)
      }
    
    func updateUI(isLoggedIn: Bool) {
        login.signInWithAppleButton.isHidden = isLoggedIn
        login.signOutButton.isHidden = !isLoggedIn
        login.button5.isHidden = !isLoggedIn

//        userIdLabel.text = isLoggedIn ? "UserID: \(userId)" : ""
        login.firstNameLabel.text = isLoggedIn ? "id: \(firstName)" : ""
        login.lastNameLabel.text = isLoggedIn ? "name: \(lastName)" : ""
        login.userImageView.image = isLoggedIn ? (userImage ?? UIImage(systemName: "person.circle")) : UIImage(systemName: "person.circle")

//        userIdLabel.isHidden = !isLoggedIn
        login.firstNameLabel.isHidden = !isLoggedIn
        login.lastNameLabel.isHidden = !isLoggedIn
        login.userImageView.isHidden = !isLoggedIn
        login.containerView.isHidden = !isLoggedIn

    }
}



extension LoginViewController: ASAuthorizationControllerDelegate {
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization failed: \(error.localizedDescription)")
    }
    
            func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
                if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                    self.userId = appleIDCredential.user
                    self.firstName = appleIDCredential.fullName?.givenName ?? ""
                    self.lastName = appleIDCredential.fullName?.familyName ?? ""
    
                    DispatchQueue.global().async { [weak self] in
                        if let url = URL(string: "https://example.com/user/profileImage/\(self?.userId ?? "")"),
                           let data = try? Data(contentsOf: url),
                           let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.userImage = image
                                self?.updateUI(isLoggedIn: true)
                            }
                        } else {
                            DispatchQueue.main.async {
                                self?.updateUI(isLoggedIn: true)
                            }
                        }
                    }
                } else {
                    print("Authorization did not return an ASAuthorizationAppleIDCredential")
                }
            }
}
    
 extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
        
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return self.view.window!
    
              }
            
        
        
    }
