import SwiftUI
import ElementBuilder
import UIKit


class ModelButtomMenu { }


class CustomNavigationController: UINavigationController {
    
    let customButtomMenu = CustomButtomMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
        
        setupBottomMenu() ; showInitialViewController()
        self.delegate = self
    }
    
    private func setupBottomMenu() {
        view.addSubview(customButtomMenu)
        
        customButtomMenu.translatesAutoresizingMaskIntoConstraints = false

        customButtomMenu.openHabitVC.addTarget(self, action: #selector(habitButtonTapped), for: .touchUpInside)

        customButtomMenu.openListVC.addTarget(self, action: #selector(screenVC), for: .touchUpInside)

        customButtomMenu.openNotesVC.addTarget(self, action: #selector(screenVC), for: .touchUpInside)

        customButtomMenu.openStatisticsVC.addTarget(self, action: #selector(screenVC), for: .touchUpInside)

        customButtomMenu.openSettingVC.addTarget(self, action: #selector(screenVC), for: .touchUpInside)
        
        Layout.applyView(customButtomMenu, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 12,  additionalConstraints: {make in
            make.height.equalTo(60)
        })
        
    }
    
    func openVC( number: Int) {
      var viewController: UIViewController
        
      switch number {
      case 1:
          viewController = ListVC()
      case 2:
          viewController =  NotesVC()
      case 3:
          viewController = CalendarViewController()
      case 4:
          viewController = SettingVC()
      default:
          return
      }
      self.setViewControllers( [ viewController ], animated: false)
  }

  @objc func screenVC(_ sender: UIButton) {
      openVC(number: sender.tag)
  }
    
    @objc func habitButtonTapped(_ sender: UIButton) {
        let habitVC  = HabitVC()
        let navController = UINavigationController(rootViewController: habitVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    func updateButtonVisibility() {
        if let currentViewController = self.viewControllers.last {
            if currentViewController is ListVC {
                customButtomMenu.openHabitVC.isHidden = false
            } else {
                customButtomMenu.openHabitVC.isHidden = true
            }
        }
    }
    
    func showInitialViewController() {
        let listVC = ListVC()
        self.setViewControllers([listVC], animated: false)
    }
}

extension CustomNavigationController { }


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





//    @objc func homeButtonTapped(_ sender: UIButton) {
//          let listVC = ListVC()
//          self.setViewControllers([listVC], animated: false)
//    }
//
//    @objc func notesButtonTapped(_ sender: UIButton) {
//        let notesVC = NotesVC()
//        self.setViewControllers([notesVC], animated: false)
//    }
//
//    @objc func statisticButtonTapped(_ sender: UIButton) {
//        let stat = CalendarViewController()
//        self.setViewControllers([stat], animated: false)
//    }
//
//    @objc func settingButtonTapped(_ sender: UIButton) {
//        let settingVC = SettingVC()
//        self.setViewControllers([settingVC], animated: false)
//    }

