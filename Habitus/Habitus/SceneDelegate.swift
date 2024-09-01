import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene )
        let customNavigationController = CustomNavigationController()
        window.rootViewController = customNavigationController
        window.makeKeyAndVisible()
        self.window = window
        
        if let theme = UserDefaults.standard.string(forKey: "theme") {
            if theme == "dark" {
                window.overrideUserInterfaceStyle = .dark
            } else {
                window.overrideUserInterfaceStyle = .light
            }
        } else {
            window.overrideUserInterfaceStyle = .unspecified
        }
        
//      let   window = UIWindow(windowScene: windowScene)
//             window.rootViewController = MainViewController()
//             window.makeKeyAndVisible()
//        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}














//import SwiftUI
//
//class MainViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        let openButton = UIButton(type: .system)
//        openButton.setTitle("Open Collection View", for: .normal)
//        openButton.addTarget(self, action: #selector(openCollectionViewController), for: .touchUpInside)
//        openButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(openButton)
//        
//        NSLayoutConstraint.activate([
//            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//    }
//
//    @objc func openCollectionViewController() {
//        let collectionVC = MyCollectionViewController()
//        present(collectionVC, animated: true, completion: nil)
//    }
//}
//
//struct ViewControllerProvider11: PreviewProvider {
//    static var previews: some View {
//        ViewControllersPreview {
//            MainViewController()
//        }.edgesIgnoringSafeArea(.all)
//    }
//}
//
//
//class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    init() {
//        let layout = UICollectionViewFlowLayout()
//        super.init(collectionViewLayout: layout)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        collectionView.backgroundColor = .systemGroupedBackground
//        
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissController))
//        swipeDown.direction = .down
//        view.addGestureRecognizer(swipeDown)
//    }
//
//    @objc func dismissController() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6 // TextField, DatePicker и 6 кнопок
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10) // Отступы между секциями
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.contentView.subviews.forEach { $0.removeFromSuperview() } // Удаляем все подвиды из ячейки
//        
//        // Устанавливаем цвет фона в зависимости от секции
//        switch indexPath.section {
//        case 0:
//            cell.contentView.backgroundColor = .clear
//        case 1:
//            cell.contentView.backgroundColor = .yellow
//        default:
//            cell.contentView.backgroundColor = .black
//        }
//
//        if indexPath.row == 0 {
//            let textField = UITextField()
//            textField.placeholder = "Enter text"
//            textField.borderStyle = .roundedRect
//            textField.frame = cell.contentView.bounds.insetBy(dx: 10, dy: 10)
//            cell.contentView.addSubview(textField)
//        } else if indexPath.row == 1 {
//            let datePicker = UIDatePicker()
//            datePicker.datePickerMode = .dateAndTime
//            datePicker.frame = cell.contentView.bounds.insetBy(dx: 10, dy: 10)
//            cell.contentView.addSubview(datePicker)
//        } else {
//            let button = UIButton(type: .system)
//            button.setTitle("Button \(indexPath.row - 1)", for: .normal)
//            button.frame = cell.contentView.bounds.insetBy(dx: 10, dy: 10)
//            button.backgroundColor = .lightGray
//            button.layer.cornerRadius = 15
//            cell.contentView.addSubview(button)
//        }
//        
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width - 40
//        return CGSize(width: width, height: 50)
//    }
//    
// 
//
//       // Установка отступов от краев секций
//       func collectionVie(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) // Отступы для секций
//       }
//
//       // Установка минимального расстояния между строками
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//           return 20 // Расстояние между строками
//       }
//
//       // Установка минимального расстояния между элементами в строке
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//           return 20 // Расстояние между элементами в строке
//       }
//}
