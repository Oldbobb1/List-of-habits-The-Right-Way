import SwiftUI
import UIKit
import ElementBuilder


class HabitVC: UIViewController {
    
    let habitView = HabitUI(); let habitModel = HabitModel()
    
    var swipe: SwipeClass?; var selectedColor: UIColor?
    
//    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
                
        habitView.initializeUI(view)
    
//        swipeActions()
//        configureSettingsItems()
        configureUI()
    }
   
//    func configureSettingsItems() {
//        settingsItems = [
//           ("paintbrush", "Color", false, { self.showColorPicker()}),
//            ("repeat.circle", "Signal repeat", true, nil),
//        ]
//    }
        
    func configureUI() {
        habitView.createTableView.dataSource = self
        habitView.createTableView.delegate = self
        
        habitView.buttonCloseUIView.addTarget(self, action: #selector(closeHabitVC), for: .touchUpInside)
        habitView.buttonSaveAndSendInTable.addTarget(self, action: #selector(saveHabitAdnSendButtonTapped), for: .touchUpInside)
        habitView.buttonSaveAndSendInTable.isEnabled = false
    }
    
//    let cellHeights = [100, 100, 45, 50]
    
    var selectedIndexPath: IndexPath?
    
}




struct ViewControllerProvider4: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            HabitVC()
        }.edgesIgnoringSafeArea(.all)
    }
}












