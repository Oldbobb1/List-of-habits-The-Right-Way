import SwiftUI
import UIKit
import ElementBuilder


class HabitVC: UIViewController {
 
    
    let habitView = HabitUI(); let habitModel = HabitModel()
    
    var swipe: SwipeClass?;  var selectedColor: UIColor?
    
    var selectedTime: Date?
    

    var selectedDays: [Int] = []
    
    var daysModel = DaysModel()
    
//    var settingsItems: [(image: String, title: String, hasSwitch: Bool, action: (() -> Void)?)] = []
        
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        return gradient
    }()
    
    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
        
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemTeal.withAlphaComponent(0.7).cgColor, UIColor.systemBlue.withAlphaComponent(0.6).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        return gradient
    }()
    

    private func setupGradientBackground1() {
           // Устанавливаем размеры градиентного слоя на размер таблицы
//           gradientLayer1.frame = settingView.settingTableView.bounds
           
           // Создаем представление для фона и добавляем в него градиентный слой
        let backgroundView = UIView(frame: habitView.createTableView.bounds)
           backgroundView.layer.insertSublayer(gradientLayer1, at: 0)
           
           // Устанавливаем это представление как backgroundView таблицы
        habitView.createTableView.backgroundView = backgroundView
       }

       // Обновление слоя при изменении размеров
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           // Обновляем frame градиентного слоя при изменении размеров таблицы
           gradientLayer1.frame = habitView.createTableView.bounds
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
                
        setupGradientBackground()
        setupGradientBackground1()
        habitView.initializeUI(view)
        swipeActions()
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
        
//
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







