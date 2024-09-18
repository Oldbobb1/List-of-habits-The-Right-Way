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
        
        self.delegate = self

    }
    
    private func setupBottomMenu() {
        view.addSubview(customButtomMenu)
        customButtomMenu.translatesAutoresizingMaskIntoConstraints = false
        
        customButtomMenu.openHabitVC.addTarget(self, action: #selector(habitButtonTapped), for: .touchUpInside)
        customButtomMenu.openListVC.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        customButtomMenu.openNotesVC.addTarget(self, action: #selector(notesButtonTapped), for: .touchUpInside)
        customButtomMenu.openStatisticsVC.addTarget(self, action: #selector(statisticButtonTapped), for: .touchUpInside)
        customButtomMenu.openSettingVC.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
    }
    
    private func layout() {
        Layout.applyView(customButtomMenu, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 12,  additionalConstraints: {make in
            make.height.equalTo(60)
        })
    }
    
//    @objc func habitButtonTapped(_ sender: UIButton) {
//        if let currentViewController = self.viewControllers.last, currentViewController is ListVC {
//            let habitVC  = HabitVC()
//            let navController = UINavigationController(rootViewController: habitVC)
//            navController.modalPresentationStyle = .fullScreen
//            self.present(navController, animated: true, completion: nil)
//        } else {
//            print("Сейчас отображается другой контроллер.")
//        }
//        updateButtonVisibility()
//    }
        
    @objc func habitButtonTapped(_ sender: UIButton) {
        let habitVC  = HabitVC()
        let navController = UINavigationController(rootViewController: habitVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
        
    @objc func homeButtonTapped(_ sender: UIButton) {
          let listVC = ListVC()
          self.setViewControllers([listVC], animated: false)
    }
    
    @objc func notesButtonTapped(_ sender: UIButton) {
        let notesVC = NotesVC()
        self.setViewControllers([notesVC], animated: false)
    }
    
    @objc func statisticButtonTapped(_ sender: UIButton) {
        let stat = CalendarViewController()
        self.setViewControllers([stat], animated: false)
    
    }
    
    @objc func settingButtonTapped(_ sender: UIButton) {
        let settingVC = SettingVC()
        self.setViewControllers([settingVC], animated: false)
    }
    
    func updateButtonVisibility() {
        if let currentViewController = self.viewControllers.last {
            // Проверяем, что текущий контроллер - это нужный вам контроллер
            if currentViewController is ListVC {
                customButtomMenu.openHabitVC.isHidden = false
            } else {
                customButtomMenu.openHabitVC.isHidden = true
            }
        }
    }

}


extension CustomNavigationController: UINavigationControllerDelegate {
 
    // Переопределяем метод, который срабатывает при смене контроллера
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        updateButtonVisibility()
    }
}




struct ViewControllerProvider0: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            CustomNavigationController()
        }.edgesIgnoringSafeArea(.all)
    }
}




