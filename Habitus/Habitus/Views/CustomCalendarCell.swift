import UIKit
import JTAppleCalendar
import ElementBuilder


class CustomCalendarCell: JTACDayCell {
    
    let dayOfWeekLabel = Label.label(fontSize: 12, weight: .regular, textColor: .gray,textAlignment: .center,backgroundColor: .clear)
    
    let dateLabel = Label.label(fontSize: 18, weight: .regular,textAlignment: .center, backgroundColor: .clear)
    
    let selectedView: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray6
         view.layer.cornerRadius = 18
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 4
         return view
     }()
    
    let currentDayHighlightView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.blue.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        return view
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        contentView.addSubview(currentDayHighlightView)
        contentView.addSubview(selectedView)
        contentView.addSubview(dayOfWeekLabel)
        contentView.addSubview(dateLabel)

        // Констрейнты для currentDayHighlightView
        currentDayHighlightView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(43)   // Ширина круга, охватывающая дату и день
//            make.height.equalTo(60)// Высота, чтобы охватить и дату, и день недели
            make.top.equalToSuperview().offset(0)  // Зафиксировать верхнюю границу
            make.bottom.equalToSuperview().offset(-0)
        }
    
        // Констрейнты для selectedView
        selectedView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.width.height.equalTo(36)
        }

        // Констрейнты для дня недели и даты
        dayOfWeekLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(3)
            make.centerX.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dayOfWeekLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureCell(state: CellState, date: Date) {
        // Устанавливаем текст для даты и дня недели
        dateLabel.text = state.text
        let dayOfWeek = getDayOfWeek(from: state.date)
        dayOfWeekLabel.text = dayOfWeek
        
        // Проверяем, выделен ли день
        if state.isSelected {
            select()
        } else {
            deselect()
        }
        
        // Обрабатываем выделение текущего дня
        handleCurrentDayHighlight(cellState: state)
    }
    
    private func getDayOfWeek(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from: date).uppercased()
    }
    
    private func handleCurrentDayHighlight(cellState: CellState) {
        let today = Date()
        if Calendar.current.isDate(cellState.date, inSameDayAs: today) {
            currentDayHighlightView.isHidden = false
            dateLabel.textColor = .systemRed
            dayOfWeekLabel.textColor = .white // Также выделяем день недели
        } else {
            currentDayHighlightView.isHidden = true
        }
    }
    
    func select() {
        selectedView.isHidden = false
        dateLabel.textColor = .red
        dayOfWeekLabel.textColor = .red // Выделяем день недели при выборе
    }
    
    func deselect() {
        dateLabel.textColor = .label
        dayOfWeekLabel.textColor = .black // Сбрасываем цвет при отмене выбора
    }
}
