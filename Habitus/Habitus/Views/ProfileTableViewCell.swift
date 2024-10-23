import UIKit
import SnapKit
import ElementBuilder


class ProfileTableViewCell: UITableViewCell {
    
    let profileImageView = Image.image("person.circle", cornerRadius: 35, contentMode: .scaleAspectFit)
    
    let profileLabel = Label.label(text: "", fontSize: 18, weight: .medium, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    let profileSubtitleLabel = Label.label(text: "", fontSize: 14, weight: .regular, textColor: .gray, textAlignment: .center, backgroundColor: .clear)
        
    let container = containerView(backgroundColor:.systemGray6,cornerRadius: 25,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .vertical,distribution: .fillProportionally,spacing: 36,layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Upgrade to Premium" ,cornerRadius: 15, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, shadowColor:UIColor.darkGray.cgColor,shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3)
    
    weak var views: SettingVC?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        stackView.addArrangedSubview(container)
        container.addSubview(profileImageView)
        container.addSubview(profileLabel)
        container.addSubview(profileSubtitleLabel)
        
       
        stackView.addArrangedSubview(buttonCloseUIView1)
        
        layout()
        
        buttonCloseUIView1.addAction(UIAction{[weak self] _ in
            guard let self = self else { return }
            let sub = SubscribeVC()
            sub.modalPresentationStyle = .fullScreen
            views?.present(sub, animated: true, completion: nil)
        }, for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
            make.height.equalTo(170) // Высота stackView
        }
        
        Layout.applyView(profileImageView, view: contentView, additionalConstraints: { make in
            make.centerY.equalTo(self.container.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(70)
        })
        
        Layout.applyView(profileLabel, view: container, topOffset: 16, leadingOffset: 86)
        
        profileSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(profileLabel.snp.bottom).offset(15)
            make.bottom.lessThanOrEqualTo(container.snp.bottom).offset(-10)
        }

    }
    
    func configure(profileImage: UIImage?, name: String, subtitle: String) {
        profileImageView.image = profileImage
        profileLabel.text = name
        profileSubtitleLabel.text = subtitle
    }

}






//class SetupCell3: UITableViewCell {
// 
//    var isUserLoggedIn = false
//    var userName: String = ""
//    var userImage: UIImage?
//    
//  let settingView = SettingUI()
//    
//    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"Sign in Apple", cornerRadius: 18, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), configuration: .plain(), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "apple.logo",setImage: nil, imageSize:CGSize(width: 20, height: 25),alpha: 1, shadowColor:UIColor.darkGray.cgColor,shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3, tintColor: UIColor(named: "daysModelTextColor"))
//    
//    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle:"LogOut" ,cornerRadius: 0, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "arrowshape.turn.up.left",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.darkGray.cgColor,shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3)
//   
//    let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.layer.cornerRadius = 15
//        stackView.spacing = 1 // Отступ между контейнерами
////                stackView.backgroundColor = .green
//        stackView.isLayoutMarginsRelativeArrangement = true
//               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView
//
//        return stackView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        contentView.addSubview(stackView)
//        stackView.addArrangedSubview(buttonCloseUIView2)
//        stackView.addArrangedSubview(buttonCloseUIView)
//        
//        buttonCloseUIView2.isHidden = true
//
//        layout()
//        
//        buttonCloseUIView.addTarget(self, action: #selector(signInWithApple), for: .touchUpInside)
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func layout(){
//        
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(1)
//              make.height.equalTo(65)// Высота stackView
//          }
//        
//    }
//    
//    @objc func signInWithApple() {
//        let request = ASAuthorizationAppleIDProvider().createRequest()
//        request.requestedScopes = [.fullName, .email]
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//    }
//    
////    func logout() {
////        isUserLoggedIn = false
////        userName = ""
////        userImage = nil
////        settingView.settingTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
////    }
//
//}
//
//
//
//extension SetupCell3: ASAuthorizationControllerDelegate {
//    
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        print("Authorization failed: \(error.localizedDescription)")
//    }
//    
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            // Handle successful authorization
//            isUserLoggedIn = true
//            userName = appleIDCredential.fullName?.givenName ?? "User"
//            userImage = UIImage(systemName: "person.fill") // Replace with actual image if available
//            settingView.settingTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
//        }
//    }
//}
//
//
//extension SetupCell3: ASAuthorizationControllerPresentationContextProviding {
//    
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.window!
//    }
//    
//}
