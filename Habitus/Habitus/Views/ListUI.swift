import UIKit
import ElementBuilder
import JTAppleCalendar


class ListUI {
    
    let titleLabel = Label.label(text: "List", fontSize: 28, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    let messageLabel = Label.label(text: "Welcome to Habit!", fontSize: 24, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    let descriptionLabel = Label.label(text: "Track your daily habits and improve your life", fontSize: 17, weight: .light, textColor: .gray, textAlignment: .center, backgroundColor: .clear)
    let image = Image.image("welcome", contentMode: .scaleToFill)
    let calendarDateStackView = StackView.stackView(axis: .horizontal)
    let userContentTableView = UITableView()
//    let buttonOpenHabitVC = ButtonsWithAction.makeButton(backgroundColor: .clear, systemName: "plus.circle", setImage: nil,alpha: 0.5)
    let calendarView: JTACMonthView = {
        let calendar = JTACMonthView()
        calendar.scrollDirection = .horizontal
        calendar.showsHorizontalScrollIndicator = false
        calendar.scrollingMode = .stopAtEachCalendarFrame
        calendar.backgroundColor = .clear
//        calendar.layer.cornerRadius = 15
//        calendar.layer.borderWidth = 1
        calendar.minimumLineSpacing = 0
        calendar.minimumInteritemSpacing = 0
        calendar.layer.shadowColor = UIColor.black.cgColor
        calendar.layer.shadowOffset = CGSize(width: 0, height: 2)
        calendar.layer.shadowOpacity = 0.4
        calendar.layer.shadowRadius = 4
        calendar.clipsToBounds = false
        return calendar
    }()
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        return formatter
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .lightGray
        label.textColor = .systemBackground
        label.backgroundColor = .clear
//        label.textAlignment = .center
        return label
    }()
    
    func initializeUI(_ view: UIView) {
        
        view.addSubview(titleLabel)
        view.addSubview(monthLabel)
        view.addSubview(calendarView)
        view.addSubview(messageLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(image)
        view.addSubview(calendarDateStackView)
        view.addSubview(userContentTableView)
        
//        view.addSubview(buttonOpenHabitVC)
//        self.userContentTableView.addSubview(buttonOpenHabitVC)
        
        self.userContentTableView.addSubview(messageLabel)
        self.userContentTableView.addSubview(image)
        self.userContentTableView.addSubview(descriptionLabel)
        
        setupView(view)
        layout(view)

    }
    
    func setupView(_ view: UIView) {
        userContentTableView.frame = view.bounds
        userContentTableView.backgroundColor = .systemBackground
        userContentTableView.layer.cornerRadius = 25
//        userContentTableView.layer.borderWidth = 1
        userContentTableView.showsVerticalScrollIndicator = false
        userContentTableView.register(HabitTrackerCell.self, forCellReuseIdentifier: "habitCell")
        
        calendarView.register(CustomCalendarCell.self, forCellWithReuseIdentifier: "CustomCalendarCell")
    }
    
    func layout(_ view: UIView) {
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        
        monthLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(10)
        }

//        Layout.applyView(calendarDateStackView, view: view ,trailingOffset: 0, additionalConstraints: {make in
//            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
//            make.height.equalTo(38)
//            make.width.equalTo(100)
//        })

        Layout.applyView(userContentTableView, view: view, leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
//            make.top.equalTo(self.calendarDateStackView.snp.bottom).offset(5)
                        make.top.equalTo(self.calendarView.snp.bottom).offset(15)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        })
        
        Layout.applyView(messageLabel, view: view, topOffset: 350, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(descriptionLabel, view: view, topOffset: 376, leadingOffset: 10, trailingOffset: -10)
        
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(250)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100) // Размер изображения
        }
        
//        Layout.applyView(buttonOpenHabitVC, view: view, leadingOffset: 10 , bottomOffset: -60)
        
        calendarView.snp.makeConstraints { make in
            // make.top.equalTo(daysOfWeekStackView.snp.bottom).offset(-20)
            make.top.equalTo(monthLabel.snp.bottom).offset(10)
            
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(60).priority(.high)
        }

    }
}


