import SwiftUI
import UIKit
import FSCalendar
import ElementBuilder


class CalendarViewController: UIViewController {
    
    let calendar = FSCalendar()
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Close",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let buttonDeleteUIView = ButtonsWithAction.makeButton(setTitle: "Delete",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let label = Label.label(text: "name", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let buttonChangeUIView = ButtonsWithAction.makeButton(setTitle: "Edit Habit",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    var selectedDates = [Bool]()
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 15
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    let greenCircle: UIView = {
        let greenCircle = UIView()
        greenCircle.backgroundColor = .black
        greenCircle.layer.cornerRadius = 5
        greenCircle.translatesAutoresizingMaskIntoConstraints = false
        return greenCircle
    }()
    
    let redCircle: UIView = {
        let redCircle = UIView()
        redCircle.backgroundColor = .black
        redCircle.layer.cornerRadius = 5
        redCircle.translatesAutoresizingMaskIntoConstraints = false
        return redCircle
    }()
    
    let completeLabel = Label.label(text: "0 Days Complete", fontSize: 15, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel = Label.label(text: "0 Days lost", fontSize: 15, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)

    let containerView1: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 15
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    let scoreLabel = Label.label(text: "Points Accumulated: \n 0", fontSize: 15, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let buttonMuteAndEnable = ButtonsWithAction.makeButton( cornerRadius: 15,clipsToBounds: false,backgroundColor: .systemGray6,systemName: "bell.badge.slash.fill.rtl", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4)
    
    let buttonScoreApply = ButtonsWithAction.makeButton(setTitle: "Write off Points",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .systemBackground
        
        calendar.backgroundColor = .systemGray6
        calendar.layer.cornerRadius = 15
        calendar.layer.shadowColor = UIColor.black.cgColor
        calendar.layer.shadowOffset = CGSize(width: 1, height: 1)
        calendar.layer.shadowOpacity = 1
        calendar.layer.shadowRadius = 2
   
        calendar.delegate = self
        calendar.dataSource = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)
        
        view.addSubview(buttonCloseUIView)
        
        view.addSubview(buttonDeleteUIView)
        
        view.addSubview(label)
        view.addSubview(buttonChangeUIView)
        
        view.addSubview(containerView)
        containerView.addSubview(greenCircle)
        containerView.addSubview(redCircle)
        containerView.addSubview(completeLabel)
        containerView.addSubview(lostLabel)
        
        view.addSubview(containerView1)
        containerView1.addSubview(scoreLabel)
        
        view.addSubview(buttonMuteAndEnable)
        view.addSubview(buttonScoreApply)
        
        buttonCloseUIView.addTarget(self, action: #selector(close), for: .touchUpInside)

        Layout.applyView(calendar, view: view, topOffset: 60, leadingOffset: 10, trailingOffset: -10, bottomOffset: -400)
        
        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 10, additionalConstraints: { make in
            make.width.equalTo(100)
        })
        
        Layout.applyView(buttonDeleteUIView, view: view, topOffset: 0, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
        })
        
        Layout.applyView(label, view: view, topOffset: 0.85, leadingOffset: 10, trailingOffset: -10)
        
//        Layout.applyView(buttonChangeUIView, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 0)
 
        Layout.applyView(containerView, view: view,topOffset: 390, leadingOffset: 10, additionalConstraints: {make in
            make.width.equalTo(180)
            make.height.equalTo(80)
        })

        greenCircle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(20)
            make.width.height.equalTo(10)
        }
        
        completeLabel.snp.makeConstraints { make in
            make.leading.equalTo(greenCircle.snp.trailing).offset(15)
            make.centerY.equalTo(greenCircle.snp.centerY)
        }
        
        redCircle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(greenCircle.snp.bottom).offset(20)
            make.width.height.equalTo(10)
        }
        
        lostLabel.snp.makeConstraints { make in
            make.leading.equalTo(redCircle.snp.trailing).offset(15)
            make.centerY.equalTo(redCircle.snp.centerY)
        }
        
        Layout.applyView(containerView1, view: view,topOffset: 390, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(180)
            make.height.equalTo(80)
        })
        
        Layout.applyView(scoreLabel, view: containerView1, topOffset: 15, leadingOffset: 10)
                
        Layout.applyView(buttonMuteAndEnable, view: view,topOffset: 490, leadingOffset: 10, additionalConstraints: {make in
            make.width.equalTo(180)
            make.height.equalTo(58)
        })
              
        Layout.applyView(buttonChangeUIView, view: view,topOffset: 490, trailingOffset: -10, additionalConstraints: {make in
            make.height.equalTo(59)
            make.width.equalTo(180)
        })
        
        Layout.applyView(buttonScoreApply, view: view,topOffset: 570, leadingOffset: 10,trailingOffset: -10, additionalConstraints: {make in
//            make.height.equalTo(59)
//            make.width.equalTo(180)
        })
        // Выделяем выбранные даты
        let calendar = Calendar.current
        for (index, selected) in selectedDates.enumerated() {
            if selected {
                let date = calendar.date(byAdding: .day, value: index - 2, to: Date())!
                self.calendar.select(date)
            }
        }
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }

}




struct ViewControllerProvider6: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            CalendarViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}





extension CalendarViewController: FSCalendarDataSource {
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let calendar = Calendar.current
        let dayIndex = calendar.component(.day, from: date) - 1
        
        if dayIndex >= 0 && dayIndex < selectedDates.count {
            selectedDates[dayIndex].toggle()

            // Обновляем отображение календаря
            if selectedDates[dayIndex] {
                // Выделяем дату в календаре
                self.calendar.select(date, scrollToDate: true)
            } else {
                // Снимаем выделение с даты в календаре
                self.calendar.deselect(date)
            }
        }
    }

    // Метод, который определяет количество событий для определенной даты
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let calendar = Calendar.current
        let dayIndex = calendar.component(.day, from: date) - 1
        
        if dayIndex >= 0 && dayIndex < selectedDates.count && selectedDates[dayIndex] {
            return 1 // Возвращаем 1, если дата выбрана
        }
        return 0 // Возвращаем 0, если дата не выбрана
    }
    
    
}








extension CalendarViewController: FSCalendarDelegate { }
