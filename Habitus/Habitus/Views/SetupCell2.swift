import UIKit
import ElementBuilder
//import AuthenticationServices


class SetupCell2: UITableViewCell {
    
//    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"Star" ,cornerRadius: 20, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "star.square",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//   
//    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Subscribe" ,cornerRadius: 20, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "dollarsign.circle.fill",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//    
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"Star" ,cornerRadius: 18, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6,shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
   
    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Subscribe" ,cornerRadius: 18, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 1 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
                stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        buttonCloseUIView1.isHidden = true ; buttonCloseUIView2.isHidden = true
        
        
        buttonCloseUIView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        buttonCloseUIView.clipsToBounds = true
        
        buttonCloseUIView1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        buttonCloseUIView1.clipsToBounds = true
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCloseUIView)
        
        stackView.addArrangedSubview(buttonCloseUIView1)
//        stackView1.addArrangedSubview(buttonCloseUIView2)
        
        
        contentView.addSubview(stackView1)
        
        layout()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        
//        stackView.snp.makeConstraints { make in
//              make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
//              make.height.equalTo(40) // Высота stackView
//          }
        
//        stackView.snp.makeConstraints { make in
//              make.top.equalToSuperview().inset(5) // Отступ сверху
//              make.leading.trailing.equalToSuperview().inset(5) // Горизонтальные отступы
//              make.height.equalTo(40) // Высота stackView
//          }
//          
//          // Размещение stackView1 под stackView
//          stackView1.snp.makeConstraints { make in
//              make.top.equalTo(stackView.snp.bottom).offset(5) // Отступ сверху от stackView
//              make.leading.trailing.equalToSuperview().inset(5) // Горизонтальные отступы
//              make.height.equalTo(40) // Высота stackView1
//              make.bottom.equalToSuperview().inset(5) // Отступ снизу
//          }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
//              make.top.equalToSuperview().inset(1) // Отступ сверху
              make.leading.trailing.equalToSuperview().inset(50) // Горизонтальные отступы
//            make.trailing.equalToSuperview().inset(175)
              make.height.equalTo(100)// Высота stackView
//            make.width.equalToSuperview().inset(90)
          }
        
//        stackView1.snp.makeConstraints { make in
//            make.top.equalTo(stackView.snp.bottom).offset(-10) // Отступ сверху от stackView
////              make.leading.trailing.equalToSuperview().inset(1) // Горизонтальные отступы
//            make.leading.trailing.equalToSuperview().inset(10)
//            make.height.equalTo(70) // Высота stackView1
//            make.bottom.equalToSuperview().inset(1) // Отступ снизу
////            make.width.equalToSuperview().inset(90)
//        }
        
    }
    
//    @objc func signInWithApple() {
//        // Здесь должна быть логика входа через Apple (например, запрос на аутентификацию)
//        // После успешного входа, отображаем скрытые кнопки
//
//        // Пример: после успешного входа
//        buttonCloseUIView1.isHidden = false
//        buttonCloseUIView2.isHidden = false
//    }
}
    




//import AuthenticationServices
//
//class SetupCell2: UITableViewCell, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
//
//    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Sign in Apple", cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), configuration: .plain(), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "apple.logo", setImage: nil, imageSize: CGSize(width: 20, height: 25), alpha: 1, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//
//    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle: "Backup", cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "icloud.and.arrow.up", setImage: nil, imageSize: CGSize(width: 30, height: 30), alpha: 1, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//
//    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle: "LogOut", cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "arrowshape.turn.up.left", setImage: nil, imageSize: CGSize(width: 30, height: 30), alpha: 1, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//
//    let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.layer.cornerRadius = 15
//        stackView.spacing = 5 // Отступ между контейнерами
//        return stackView
//    }()
//
//    let stackView1: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.layer.cornerRadius = 15
//        stackView.spacing = 5 // Отступ между контейнерами
//        return stackView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        contentView.addSubview(stackView)
//        stackView.addArrangedSubview(buttonCloseUIView)
//
//        // Изначально скрываем кнопки buttonCloseUIView1 и buttonCloseUIView2
//        buttonCloseUIView1.isHidden = true
//        buttonCloseUIView2.isHidden = true
//
//        stackView1.addArrangedSubview(buttonCloseUIView1)
//        stackView1.addArrangedSubview(buttonCloseUIView2)
//
//        contentView.addSubview(stackView1)
//
//        layout()
//
//        // Добавляем действие на кнопку для входа через Apple
//        buttonCloseUIView.addTarget(self, action: #selector(signInWithApple), for: .touchUpInside)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func layout() {
//        stackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(5) // Отступ сверху
//            make.leading.trailing.equalToSuperview().inset(5) // Горизонтальные отступы
//            make.height.equalTo(40) // Высота stackView
//        }
//
//        stackView1.snp.makeConstraints { make in
//            make.top.equalTo(stackView.snp.bottom).offset(5) // Отступ сверху от stackView
//            make.leading.trailing.equalToSuperview().inset(5) // Горизонтальные отступы
//            make.height.equalTo(40) // Высота stackView1
//            make.bottom.equalToSuperview().inset(5) // Отступ снизу
//        }
//    }
//
//    // Метод для входа через Apple
//    @objc func signInWithApple() {
//        let request = ASAuthorizationAppleIDProvider().createRequest()
//        request.requestedScopes = [.fullName, .email]
//
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//    }
//
//    // MARK: - ASAuthorizationControllerDelegate Methods
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            // Проверяем успешный вход
//
//            // Когда аутентификация прошла успешно, отображаем скрытые кнопки
//            buttonCloseUIView1.isHidden = false
//            buttonCloseUIView2.isHidden = false
//
//            // Дополнительная обработка данных пользователя, если нужно
//            let userIdentifier = appleIDCredential.user
//            let email = appleIDCredential.email
//            let fullName = appleIDCredential.fullName
//
//            print("User ID: \(userIdentifier), Email: \(email ?? ""), Full Name: \(fullName?.givenName ?? "")")
//        }
//    }
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        // Обработка ошибки при входе
//        print("Apple Sign-In Failed: \(error.localizedDescription)")
//    }
//
//    // MARK: - ASAuthorizationControllerPresentationContextProviding Method
//
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return UIApplication.shared.windows.first { $0.isKeyWindow } ?? UIWindow()
//    }
//}





