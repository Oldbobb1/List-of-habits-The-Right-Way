import SwiftUI
import UIKit
import SnapKit
import ElementBuilder


class ListVC: UIViewController {
    
    let habitCell = "HabitTableViewCell"
    let maxElements = 10
    let listView = ListUI()
    let listModel = ListModel ()
    let dateAndWeekdayFormatter = DateAndWeekDayFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(newHabitAdded(_:)), name: Notification.Name("NewHabitAdded"), object: nil)
    }
    
    private func configureUI() {
        listModel.loadHabitData()
        listView.initializeUI(view)
        updateDaysCalendar()
        listView.userContentTableView.delegate = self
        listView.userContentTableView.dataSource = self
        listView.buttonOpenHabitVC.addTarget(self, action: #selector(openHabbitCreation) , for: .touchUpInside)
    }
    
    func updateDaysCalendar() {
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateAndWeekdayFormatter.dateCurrent(to: listView.calendarDateStackView, withDay: day)
        }
    }
    
    @objc func openHabbitCreation(_ sender: UIButton) {
        let habitVC  = HabitVC()
        let navController = UINavigationController(rootViewController: habitVC)
        navController.modalPresentationStyle = .fullScreen
        animateButtonScale(for: sender, scaleFactor: 1.1)
        self.present(navController, animated: true, completion: nil)
    }
    
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

