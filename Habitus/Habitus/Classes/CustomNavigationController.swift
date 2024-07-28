import SwiftUI
import ElementBuilder
import UIKit


class CustomNavigationController: UINavigationController {
        
    let customButtomMenu = CustomButtomMenu()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationBar.isHidden = true
        
        setupBottomMenu()
        showInitialViewController()
        layout()
    }

    private func setupBottomMenu() {
        
        view.addSubview(customButtomMenu)
        customButtomMenu.translatesAutoresizingMaskIntoConstraints = false
        
        customButtomMenu.openListVC.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        customButtomMenu.openNotesVC.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        customButtomMenu.openSettingVC.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    private func layout() {
        Layout.applyView(customButtomMenu, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 12,  additionalConstraints: {make in
            make.height.equalTo(60)
        })
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        let listVC = ListVC()
        self.setViewControllers([listVC], animated: false)
    }
    
    @objc func cartButtonTapped(_ sender: UIButton) {
        let notesVC = NotesVC()
        self.setViewControllers([notesVC], animated: false)
    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton) {
        let settingVC = SettingVC()
        self.setViewControllers([settingVC], animated: false)
    } 
    
//    @objc func favoriteButtonTapped(_ sender: UIButton) {
//        let habitVC  = HabitVC()
//        let navController = UINavigationController(rootViewController: habitVC)
//        navController.modalPresentationStyle = .fullScreen
//        self.present(navController, animated: true, completion: nil)
//    }
}





struct ViewControllerProvider0: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            CustomNavigationController()
        }.edgesIgnoringSafeArea(.all)
    }
}
