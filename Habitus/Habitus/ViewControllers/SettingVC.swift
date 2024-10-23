import SwiftUI
import UIKit


class SettingVC: UIViewController  {
    
    var isUserLoggedIn = false
    var userName: String = ""
    var userImage: UIImage?
    
    let settingView = SettingUI()
    let settingModel = SettingModel()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemTeal.cgColor,
            UIColor.systemIndigo.cgColor
        ] // 0.9
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemTeal.withAlphaComponent(0.8).cgColor,
            UIColor.systemIndigo.withAlphaComponent(0.8).cgColor
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
        
    }
    
    private func setupGradientBackground1() {
        let backgroundView = UIView(frame: settingView.settingTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer1, at: 0)
        settingView.settingTableView.backgroundView = backgroundView
    }
    // Обновление слоя при изменении размеров
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer1.frame = settingView.settingTableView.bounds
    }

}




struct ViewControllerProvider3: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SettingVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
