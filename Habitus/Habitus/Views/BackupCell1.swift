import UIKit
import ElementBuilder


class BackupCell1: UITableViewCell {
    
    let buttonCopy = ButtonsWithAction.makeButton(setTitle: "Создать сейчас", cornerRadius: 18, setTitleColor: .label, clipsToBounds: false, backgroundColor: .systemGray6, shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3)
    
    let buttonCopy1 = ButtonsWithAction.makeButton(setTitle: "Создавать автоматически: Выкл.", cornerRadius: 15, setTitleColor: .label, clipsToBounds: false, backgroundColor: .systemGray6, shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .vertical, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 18, spacing: 10, layoutMargins: .init(top: 15, left: 15, bottom: 15, right: 15))
    
    // Храним текущее выбранное значение
    var selectedOption: String = "Выкл."
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCopy)
        stackView.addArrangedSubview(buttonCopy1)
        
        layuot()
        
        // Добавляем действие на кнопку выбора подписки
//        buttonCopy1.addTarget(self, action: #selector(showSubscriptionOptions), for: .touchUpInside)
        
        buttonCopy1.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.showSubscriptionOptions()
        }, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layuot() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(140)
        }
    }
    
     func showSubscriptionOptions() {
        let alertController = UIAlertController(title: "Выберите подписку", message: nil, preferredStyle: .actionSheet)
        
        let option1 = UIAlertAction(title: getTitleForOption("Ежедневно"), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Ежедневно")
        }
        
        let option2 = UIAlertAction(title: getTitleForOption("Еженедельно"), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Еженедельно")
        }
        
        let option3 = UIAlertAction(title: getTitleForOption("Ежемесячно"), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Ежемесячно")
        }
        
        let option4 = UIAlertAction(title: getTitleForOption("Выкл."), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Выкл.")
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(option1)
        alertController.addAction(option2)
        alertController.addAction(option3)
        alertController.addAction(option4)
        alertController.addAction(cancelAction)
        
        if let viewController = self.window?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func getTitleForOption(_ option: String) -> String {
        // Добавляем галочку к выбранному варианту
        return selectedOption == option ? "✓ \(option)" : option
    }
    
    private func updateButtonTitle(with option: String) {
        // Обновляем текст кнопки и текущее выбранное значение
        self.selectedOption = option
        self.buttonCopy1.setTitle("Создавать автоматически: \(option)", for: .normal)
    }
}
