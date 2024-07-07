//  ListVC.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit
import SnapKit

class ListVC: UIViewController {
    
    let habitCell = "HabitTableViewCell"
    let maxElements = 10
    let listView = HabitListUI(), listModel = HabitManager ()
    
     override func viewDidLoad() {
        super.viewDidLoad()
         
         configureUI()
         
        NotificationCenter.default.addObserver(self, selector: #selector(newHabitAdded(_:)), name: Notification.Name("NewHabitAdded"), object: nil)
    }
    
    private func configureUI() {
        listModel.loadHabitData()
        listView.initializeUI(view)
        listView.updateDaysCalendar()
        listView.userContentTableView.delegate = self
        listView.userContentTableView.dataSource = self
        listView.userContentTableView.frame = view.bounds
        listView.userContentTableView.register(HabitTrackerCell.self, forCellReuseIdentifier: "habitCell")
        listView.createButton.addTarget(self, action: #selector(openHabbitCreation) , for: .touchUpInside)
    }
    
    @objc func openHabbitCreation(_ sender: UIButton) {
        let habitVC  = HabitVC()
        let navController = UINavigationController(rootViewController: habitVC)
        navController.modalPresentationStyle = .fullScreen
        animateButtonScaleChange(for: sender, scaleFactor: 1.3)
        self.present(navController, animated: true, completion: nil)
    }
    
    func animateButtonScaleChange(for button: UIButton, scaleFactor: CGFloat) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
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
   
    func toggleMessageLabelVisibility() {
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
     }
}



