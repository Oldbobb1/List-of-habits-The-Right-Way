import SwiftUI
import SnapKit
import UIKit


class NotesVC: UIViewController {
    
    let notesView = NotesUI()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        notesView.initializeUI(view)
        
    }
 
}




struct ViewControllerProvider2: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            NotesVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
















//class NotesVC: UIViewController {
//
//    let calendarView: JTACMonthView = {
//        let calendar = JTACMonthView()
//        calendar.scrollDirection = .horizontal
//        calendar.showsHorizontalScrollIndicator = false
//        calendar.scrollingMode = .stopAtEachCalendarFrame
//        calendar.backgroundColor = .clear
////        calendar.layer.cornerRadius = 15
////        calendar.layer.borderWidth = 1
//        calendar.minimumLineSpacing = 0
//        calendar.minimumInteritemSpacing = 0
//        
//        calendar.layer.shadowColor = UIColor.black.cgColor
//        calendar.layer.shadowOffset = CGSize(width: 0, height: 2)
//        calendar.layer.shadowOpacity = 0.4
//        calendar.layer.shadowRadius = 4
//        return calendar
//    }()
//    
//    let formatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy MM dd"
//        return formatter
//    }()
//    
//    let monthLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .lightGray
//        label.backgroundColor = .clear
////        label.textAlignment = .center
//        return label
//    }()
//    
//    let titleLabel: UILabel = {
//         let titleLabel = UILabel()
//        titleLabel.text = "Habits"
//        titleLabel.textAlignment = .center
//        titleLabel.backgroundColor = .clear
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
//        return titleLabel
//    }()
//  
//    let containerView: UIView = {
//        let containerView = UIView()
//        containerView.backgroundColor = .systemGray6
//        containerView.layer.cornerRadius = 15
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        containerView.layer.shadowOpacity = 0.6
//        containerView.layer.shadowRadius = 4
//        return containerView
//    }()
//    
//    let containerView1: UIView = {
//        let containerView = UIView()
//        containerView.backgroundColor = .systemGray6
//        containerView.layer.cornerRadius = 15
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        containerView.layer.shadowOpacity = 0.6
//        containerView.layer.shadowRadius = 4
//        return containerView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        view.addSubview(titleLabel)
//        view.addSubview(containerView)
//        containerView.addSubview(titleLabel)
//        
//        
//        view.addSubview(monthLabel)
////        view.addSubview(containerView1)
////        containerView1.addSubview(monthLabel)
//        
//        view.backgroundColor = .white
//        
//        calendarView.calendarDataSource = self
//        calendarView.calendarDelegate = self
//        
//        calendarView.register(CustomCalendarCell.self, forCellWithReuseIdentifier: "CustomCalendarCell")
//        
//        // Отображаем текущий месяц при старте
//        calendarView.scrollToDate(Date(), animateScroll: false)
//        updateMonthLabel(for: Date())
//        
////        titleLabel.snp.makeConstraints { make in
////            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
////            make.leading.equalTo(view).offset(0)
////        }
//        Layout.applyView(titleLabel, view: containerView,topOffset: 0, leadingOffset: 0, trailingOffset: 0)
//        
//        Layout.applyView(containerView, view: view,topOffset: 0, leadingOffset: 160, trailingOffset: -160,additionalConstraints: {make in
//            make.height.equalTo(40)
//            make.width.equalTo(100)
//        })
//        
////        Layout.applyView(containerView1, view: view,topOffset: 50, leadingOffset: 10, additionalConstraints: {make in
////            make.height.equalTo(30)
////            make.width.equalTo(170)
////
////        })
//        
//        monthLabel.snp.makeConstraints { make in
//            make.top.equalTo(containerView.snp.bottom).offset(10)
//            make.leading.equalTo(10)
//        }
////        Layout.applyView(monthLabel, view: containerView1,topOffset: 2, leadingOffset: 5, trailingOffset: -5)
//        
//        view.addSubview(calendarView)
//        
//       
//        calendarView.snp.makeConstraints { make in
//          // make.top.equalTo(daysOfWeekStackView.snp.bottom).offset(-20)
//            make.top.equalTo(monthLabel.snp.bottom).offset(10)
//
//            make.leading.equalTo(view).offset(10)
//            make.trailing.equalTo(view).offset(-10)
//            make.height.equalTo(80)
//        }
//        
//    
//    }
//    
//    private func updateMonthLabel(for date: Date) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMMM, yyyy"
//        monthLabel.text = dateFormatter.string(from: date)
//    }
//}
//
//extension NotesVC: JTACMonthViewDelegate {
// 
//    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        guard let cell = cell as? CustomCalendarCell else { return }
//        cell.configureCell(state: cellState, date: date)
//    }
//    
//    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCalendarCell", for: indexPath) as! CustomCalendarCell
//        cell.configureCell(state: cellState, date: date)
//        return cell
//    }
//    
//    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
//        guard let validCell = cell as? CustomCalendarCell else { return }
//        validCell.select()
//    }
//
//    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
//        guard let validCell = cell as? CustomCalendarCell else { return }
//        validCell.deselect()
//    }
//    
//    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
//        if let date = visibleDates.monthDates.first?.date {
//            updateMonthLabel(for: date)
//        }
//    }
//
//}
//
//extension NotesVC: JTACMonthViewDataSource {
//    
//       func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
//           let startDate = formatter.date(from: "2024 01 01")!
//           let endDate = formatter.date(from: "2100 12 31")!
//           
//           let parameters = ConfigurationParameters(startDate: startDate,
//                                                    endDate: endDate,
//                                                    numberOfRows: 1,
//                                                    calendar: Calendar.current,
//                                                    generateInDates: .forAllMonths,
//                                                    generateOutDates: .tillEndOfGrid,
//                                                    hasStrictBoundaries: true)
//           return parameters
//        }
//    
//}
//
//
//
//class CustomCalendarCell: JTACDayCell {
//    let dayOfWeekLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 12)
//        label.textColor = .gray
//        return label
//    }()
//    
//    let dateLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 18)
//        return label
//    }()
//    
//    let selectedView: UIView = {
//         let view = UIView()
//         view.backgroundColor = .systemGray3
//         view.layer.cornerRadius = 18
//         return view
//     }()
//    
//    let currentDayHighlightView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.layer.cornerRadius = 15
//        view.isHidden = true // Скрыт по умолчанию
//        return view
//    }()
//            
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCellView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupCellView() {
//        contentView.addSubview(currentDayHighlightView)
//        contentView.addSubview(selectedView)
//        contentView.addSubview(dayOfWeekLabel)
//        contentView.addSubview(dateLabel)
//
//        // Констрейнты для currentDayHighlightView
//        currentDayHighlightView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(40)   // Ширина круга, охватывающая дату и день
//            make.height.equalTo(75)// Высота, чтобы охватить и дату, и день недели
//            make.top.equalToSuperview().offset(0)  // Зафиксировать верхнюю границу
//            make.bottom.equalToSuperview().offset(-15)
//        }
//    
//        // Констрейнты для selectedView
//        selectedView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(36)
//        }
//
//        // Констрейнты для дня недели и даты
//        dayOfWeekLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(5)
//            make.centerX.equalToSuperview()
//        }
//        
//        dateLabel.snp.makeConstraints { make in
//            make.top.equalTo(dayOfWeekLabel.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//        }
//    }
//    
//    func configureCell(state: CellState, date: Date) {
//        // Устанавливаем текст для даты и дня недели
//        dateLabel.text = state.text
//        let dayOfWeek = getDayOfWeek(from: state.date)
//        dayOfWeekLabel.text = dayOfWeek
//        
//        // Проверяем, выделен ли день
//        if state.isSelected {
//            select()
//        } else {
//            deselect()
//        }
//        
//        // Обрабатываем выделение текущего дня
//        handleCurrentDayHighlight(cellState: state)
//    }
//    
//    private func getDayOfWeek(from date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EE"
//        return dateFormatter.string(from: date).uppercased()
//    }
//    
//    private func handleCurrentDayHighlight(cellState: CellState) {
//        let today = Date()
//        if Calendar.current.isDate(cellState.date, inSameDayAs: today) {
//            currentDayHighlightView.isHidden = false
//            dateLabel.textColor = .red
//            dayOfWeekLabel.textColor = .white // Также выделяем день недели
//        } else {
//            currentDayHighlightView.isHidden = true
//        }
//    }
//    
//    func select() {
//        selectedView.isHidden = false
//        dateLabel.textColor = .red
//        dayOfWeekLabel.textColor = .red // Выделяем день недели при выборе
//    }
//    
//    func deselect() {
//        dateLabel.textColor = .yellow
//        dayOfWeekLabel.textColor = .black // Сбрасываем цвет при отмене выбора
//    }
//}
