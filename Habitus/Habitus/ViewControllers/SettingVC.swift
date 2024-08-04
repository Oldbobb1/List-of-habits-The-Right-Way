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
