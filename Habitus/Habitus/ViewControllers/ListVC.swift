import SwiftUI
import UIKit
import SnapKit
import ElementBuilder
import JTAppleCalendar




class ListVC: UIViewController  {

    let habitCell = "HabitTableViewCell"
    let maxElements = 10
    let listView = ListUI()
    let listModel = ListModel ()
    let dateAndWeekdayFormatter = DateAndWeekDayFormatter()


    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemCyan.withAlphaComponent(0.8).cgColor,
            UIColor.systemBlue.withAlphaComponent(0.8).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemCyan.withAlphaComponent(0.6).cgColor,
            UIColor.systemBlue.withAlphaComponent(0.6).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    

    private func setupGradientBackground1() {
           // Устанавливаем размеры градиентного слоя на размер таблицы
//           gradientLayer1.frame = settingView.settingTableView.bounds
           
           // Создаем представление для фона и добавляем в него градиентный слой
           let backgroundView = UIView(frame: listView.userContentTableView.bounds)
           backgroundView.layer.insertSublayer(gradientLayer1, at: 0)
           
           // Устанавливаем это представление как backgroundView таблицы
        listView.userContentTableView.backgroundView = backgroundView
       }

       // Обновление слоя при изменении размеров
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           // Обновляем frame градиентного слоя при изменении размеров таблицы
           gradientLayer1.frame = listView.userContentTableView.bounds
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupGradientBackground1()
        
//        view.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
        
        configureUI()

        NotificationCenter.default.addObserver(self, selector: #selector(newHabitAdded(_:)), name: Notification.Name("NewHabitAdded"), object: nil)
       
    }
    
    
    func updateMonthLabel(for date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, yyyy"
        listView.monthLabel.text = dateFormatter.string(from: date)
    }
    
    private func configureUI() {
        
        
        // Обновляем таблицу, чтобы показать загруженные привычки
        listView.userContentTableView.reloadData()
        
        listModel.loadHabitData()
        listView.initializeUI(view)
        //        updateDaysCalendar()
        listView.userContentTableView.delegate = self
        listView.userContentTableView.dataSource = self
        
        listView.calendarView.calendarDataSource = self
        listView.calendarView.calendarDelegate = self
        
        listView.calendarView.scrollToDate(Date(), animateScroll: false)
        updateMonthLabel(for: Date())
        
        //        listView.buttonOpenHabitVC.addTarget(self, action: #selector(openHabbitCreation) , for: .touchUpInside)
    }
    
    //    @objc func openHabbitCreation(_ sender: UIButton) {
    //        let habitVC  = HabitVC()
    //        let navController = UINavigationController(rootViewController: habitVC)
    //        navController.modalPresentationStyle = .fullScreen
    //        animateButtonScale(for: sender, scaleFactor: 1.1)
    //        self.present(navController, animated: true, completion: nil)
    //    }
    
    @objc func newHabitAdded(_ notification: Notification) {
        if listModel.habits.count < maxElements {
            if let newHabit = notification.object as? HabitEntry  {
                listModel.habits.append(newHabit)
                let newIndexPath = IndexPath(row: listModel.habits.count - 1, section: 0)
                listView.userContentTableView.insertRows(at: [newIndexPath], with: .automatic)
                listModel.saveHabitData()
            }
        } else { }
    }
}




struct ViewControllerProvider1: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            ListVC()
        }.edgesIgnoringSafeArea(.all)
    }
}













