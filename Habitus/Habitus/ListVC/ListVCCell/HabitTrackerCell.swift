//  HabitTrackerCell.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class HabitTrackerCell: UITableViewCell {
    
    let nameLabelCell = Label.label(text: "", fontSize: 15, weight: .bold, textColor: .label, textAlignment: .left)
    var buttonStackView = StackView.stack()
    
    var buttonStates: [ButtonState] = [] {
        didSet {
            setupDayButtons()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabelCell)
        contentView.addSubview(buttonStackView)
        
        nameLabelCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-150)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(285)
            make.centerY.equalToSuperview()
        }
        loadButtonStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(object: HabitEntry ) {
        nameLabelCell.text = object.name
        nameLabelCell.numberOfLines = 2
        contentView.backgroundColor = object.color
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let index = sender.tag
        buttonStates[index].isChecked.toggle()
        updateButtonTitle(at: index)
        saveButtonStates()
    }
    
    private func setupDayButtons() {
        buttonStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let calendar = Calendar.current
        for i in 0..<buttonStates.count {
            let date = calendar.date(byAdding: .day, value: i - 2, to: Date())!
            let dayButton = UIButton()
            dayButton.tag = i
            dayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            // Создаем метку для дня недели и числа месяца
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE"
            let dayOfWeekAndMonth = dateFormatter.string(from: date)
            dayButton.setTitle(dayOfWeekAndMonth, for: .normal)
            dayButton.titleLabel?.numberOfLines = 0
            dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            dayButton.setTitleColor(.black, for: .normal)
            
            // Устанавливаем начальное состояние кнопки в соответствии с buttonStates
            let isChecked = buttonStates[i].isChecked
            let title = isChecked ? "✔️" : "x"
            dayButton.setTitle(title, for: .normal)
            
            buttonStackView.addArrangedSubview(dayButton)
        }
    }
    
    private func updateButtonTitle(at index: Int) {
        guard index < buttonStackView.arrangedSubviews.count else { return }
        if let button = buttonStackView.arrangedSubviews[index] as? UIButton {
            let isChecked = buttonStates[index].isChecked
            let title = isChecked ? "✔️" : "x"
            button.setTitle(title, for: .normal)
        }
    }
    
    private func saveButtonStates() {
        var buttonStatesToSave = [[String: Any]]()
        for state in buttonStates {
            let stateDict: [String: Any] = ["isChecked": state.isChecked]
            buttonStatesToSave.append(stateDict)
        }
        UserDefaults.standard.set(buttonStatesToSave, forKey: "buttonStates")
    }
    
    private func loadButtonStates() {
        guard let savedButtonStates = UserDefaults.standard.array(forKey: "buttonStates") as? [[String: Any]] else {
            // Если нет сохраненных состояний, устанавливаем начальные значения по умолчанию
            buttonStates = [ButtonState](repeating: ButtonState(isChecked: false), count: 3)
            return
        }
        var loadedButtonStates = [ButtonState]()
        for stateDict in savedButtonStates {
            if let isChecked = stateDict["isChecked"] as? Bool {
                loadedButtonStates.append(ButtonState(isChecked: isChecked))
            }
        }
        buttonStates = loadedButtonStates
    }
    
}
