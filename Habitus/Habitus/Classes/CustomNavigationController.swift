import SwiftUI
import ElementBuilder
import UIKit


class CustomNavigationController: UINavigationController {
    
    let customButtomMenu = CustomButtomMenu()
    let modelNC = CustomNavigationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customButtomMenu)
        customButtomMenu.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.isHidden = true
        self.delegate = self
        
        setupBottomMenu()
        modelNC.openViewController(ofType: ListVC.self, in: self)
    }
    
    private func setupBottomMenu() {
        customButtomMenu.openHabitVC.addAction(UIAction{ [weak self] _ in
            guard let self = self else { return }
            let habitVC = HabitVC()
            habitVC.modalPresentationStyle = .fullScreen
            self.present(habitVC, animated: true, completion: nil)
        }, for: .touchUpInside)
        
        customButtomMenu.openListVC.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.modelNC.openViewController(ofType: ListVC.self, in: self)
        }, for: .touchUpInside)
        
        customButtomMenu.openNotesVC.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.modelNC.openViewController(ofType: NotesVC.self, in: self)
        }, for: .touchUpInside)
        
        customButtomMenu.openStatisticsVC.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.modelNC.openViewController(ofType: CalendarViewController.self, in: self)
        }, for: .touchUpInside)
        
        customButtomMenu.openSettingVC.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.modelNC.openViewController(ofType: SettingVC.self, in: self)
        }, for: .touchUpInside)
        
        Layout.applyView(customButtomMenu, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 12,  additionalConstraints: {make in
            make.height.equalTo(60)
        })
    }
}




struct ViewControllerProvider0: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            CustomNavigationController()
        }.edgesIgnoringSafeArea(.all)
    }
}

