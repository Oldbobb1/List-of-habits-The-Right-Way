import UIKit
import ElementBuilder


class HabitTrackerCell: UITableViewCell {
    
    let nameLabelCell = UILabel()
    let buttonStackView = UIStackView()
    
    var buttonStates: [ButtonState] = [] {
        didSet {
            setupDayButtons()
        }
    }
    
    var habitName: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabelCell)
        contentView.addSubview(buttonStackView)
    
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
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
    }
    
    func set(object: HabitEntry, habitName: String) {
        nameLabelCell.text = object.name
        contentView.backgroundColor = object.color
        buttonStates = object.buttonStates
        self.habitName = habitName // сохраняем имя привычки для использования в ключе UserDefaults
        loadButtonStates()
    }

    @objc func buttonTapped(_ sender: UIButton) {
        guard let habitName = habitName else { return }
        let index = sender.tag
        buttonStates[index].isChecked.toggle()
        updateButtonTitle(at: index)
        saveButtonStates(habitName: habitName)
    }
    
    private func setupDayButtons() {
        
        buttonStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let days = ["Вчера", "Сегодня", "Завтра"]
        for i in 0..<days.count {
            let dayButton = UIButton()
            dayButton.tag = i
            dayButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            dayButton.setTitle(days[i], for: .normal)
            dayButton.titleLabel?.numberOfLines = 0
            dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            dayButton.setTitleColor(.black, for: .normal)
            
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
    
    private func saveButtonStates(habitName: String) {
        var buttonStatesToSave = [[String: Any]]()
        for state in buttonStates {
            let stateDict: [String: Any] = ["isChecked": state.isChecked]
            buttonStatesToSave.append(stateDict)
        }
        UserDefaults.standard.set(buttonStatesToSave, forKey: "buttonStates_\(habitName)")
    }
    
    private func loadButtonStates() {
        guard let habitName = habitName else { return }
        let key = "buttonStates_\(habitName)"
        guard let savedButtonStates = UserDefaults.standard.array(forKey: key) as? [[String: Any]] else {
            // If no saved states, set default values
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
