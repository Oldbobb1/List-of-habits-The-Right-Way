import SwiftUI
import UIKit
import AuthenticationServices


class SettingVC: UIViewController  {
    
    var isUserLoggedIn = false
    var userName: String = ""
    var userImage: UIImage?
    
    let settingView = SettingUI()
    let settingModel = SettingModel()
    
//    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
//    
//    var accountItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void))] = []
    
    private let gradientLayer: CAGradientLayer = {
            let gradient = CAGradientLayer()
            gradient.colors = [
                UIColor.systemTeal.withAlphaComponent(0.9).cgColor,
                UIColor.systemIndigo.withAlphaComponent(0.9).cgColor
            ] // 0.9
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            return gradient
        }()
    
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
             gradient.colors = [
                 UIColor.systemTeal.withAlphaComponent(0.6).cgColor,
                 UIColor.systemIndigo.withAlphaComponent(0.6).cgColor
             ]
             gradient.startPoint = CGPoint(x: 0, y: 0)
             gradient.endPoint = CGPoint(x: 1, y: 1)
             return gradient
    }()

    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        
        setupGradientBackground1()
        
        settingView.settingTableView.dataSource = self
        settingView.settingTableView.delegate = self
        
        settingView.initializeUI(view)
        settingModel.requestNotificationAuthorization()
//        configureSettingsItems()
    }
    
    private func setupGradientBackground1() {
           // Устанавливаем размеры градиентного слоя на размер таблицы
//           gradientLayer1.frame = settingView.settingTableView.bounds
           
           // Создаем представление для фона и добавляем в него градиентный слой
           let backgroundView = UIView(frame: settingView.settingTableView.bounds)
           backgroundView.layer.insertSublayer(gradientLayer1, at: 0)
           
           // Устанавливаем это представление как backgroundView таблицы
        settingView.settingTableView.backgroundView = backgroundView
       }

       // Обновление слоя при изменении размеров
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           // Обновляем frame градиентного слоя при изменении размеров таблицы
           gradientLayer1.frame = settingView.settingTableView.bounds
       }
    
    //MARK: -
    
//    func configureSettingsItems() {
//        settingsItems = [
//            ("moon.stars.fill", "Оформление", true, nil),
//            ("bell.and.waves.left.and.right.fill", "Уведомления", true, nil),
//            ("questionmark.bubble", "Поддержка", false, { self.openMailApp()}),
    
//            ("text.book.closed.fill", "Гайд", false, { self.openGuidancePresentation()}),
    
//            ("star.square", "Оцените приложение", false, { self.showAlert()}),
    
//            ("dollarsign.circle.fill", "Подписка", false, { self.openSubscribeVC()})
//        ]
    
    
//        accountItems = [
//            ("apple.logo", "Войти с Apple", false, { self.signInWithApple() }),
//            ("icloud.and.arrow.up", "Резервное копирование", false, {self.backup()}),
//            ("arrowshape.turn.up.left", "Выйти", false, {self.logout()})
//        ]
//    }
        
    func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}




struct ViewControllerProvider3: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SettingVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
