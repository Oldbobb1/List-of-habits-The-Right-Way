import SwiftUI
import UIKit
import SnapKit
import ElementBuilder
import JTAppleCalendar


class ListVC: UIViewController {

    let habitCell = "HabitTableViewCell"
    let maxElements = 10
    let listView = ListUI()
    let listModel = ListModel ()
   
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemCyan.cgColor,
            UIColor.systemBlue.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemCyan.withAlphaComponent(0.7).cgColor,
            UIColor.systemBlue.withAlphaComponent(0.7).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    private func setupGradientBackground1() {
        let backgroundView = UIView(frame: listView.userContentTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer1, at: 0)
        
        listView.userContentTableView.backgroundView = backgroundView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Обновляем frame градиентного слоя при изменении размеров таблицы
        gradientLayer1.frame = listView.userContentTableView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupGradientBackground1()

        configureUI()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(newHabitAdded(_:)), name: Notification.Name("NewHabitAdded"), object: nil)
        
        NotificationCenter.default.addObserver(forName: Notification.Name("NewHabitAdded"), object: nil, queue: .main) { [weak self] notification in
            guard let self = self else { return }
            self.newHabitAdded(notification)
        }

    }
    
    deinit {
        // Удаляем наблюдателя при уничтожении контроллера
        NotificationCenter.default.removeObserver(self)
    }

    func updateMonthLabel(for date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, yyyy"
        listView.monthLabel.text = dateFormatter.string(from: date)
    }
    
    private func configureUI() {
        listView.userContentTableView.reloadData()
    
        listModel.loadHabitData()
        
        listView.initializeUI(view)
        listView.userContentTableView.delegate = self
        listView.userContentTableView.dataSource = self
        
        listView.calendarView.calendarDataSource = self
        listView.calendarView.calendarDelegate = self
        
        listView.calendarView.scrollToDate(Date(), animateScroll: false)
        
        updateMonthLabel(for: Date())

    }
     
     func newHabitAdded(_ notification: Notification) {
        if listModel.habits.count < maxElements {
            if let newHabit = notification.object as? HabitEntry  {
                listModel.habits.append(newHabit)
                let newIndexPath = IndexPath(row: listModel.habits.count - 1, section: 0)
                listView.userContentTableView.insertRows(at: [newIndexPath], with: .automatic)
                listModel.saveHabitData()
            }
        } else {
            DispatchQueue.main.async {
                self.showMaxHabitAlert()
            }
        }
    }
    
    func toggleMessageLabelVisibility() {
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
        listView.descriptionLabel.isHidden = !listModel.habits.isEmpty
        listView.image.isHidden = !listModel.habits.isEmpty
    }
    
    func showMaxHabitAlert() {
        let alert = UIAlertController(title: "Attention", message: "You have achieved the maximum number of habits.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
}




struct ViewControllerProvider1: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            ListVC()
        }.edgesIgnoringSafeArea(.all)
    }
}


