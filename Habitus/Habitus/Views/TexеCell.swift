import UIKit
import ElementBuilder


class TexеCell: UITableViewCell {
    
    let habitView = HabitUI()
    
    let switchButton: UISwitch = {
            let switchButton = UISwitch()
//            switchButton.isOn = isOn
            return switchButton
        }()
    
    let messageLabel = Label.label(text: "Color", fontSize: 20, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let messageLabel1 = Label.label(text: "Repeat", fontSize: 20, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)

    let welcomeImageView: UIImageView = {
        let welcomeImageView = UIImageView()
        welcomeImageView.image = UIImage(systemName: "paintbrush.fill")
        welcomeImageView.contentMode = .scaleAspectFit
        welcomeImageView.tintColor = .red
        return welcomeImageView
    }()
    
    let welcomeImageView1: UIImageView = {
        let welcomeImageView = UIImageView()
        welcomeImageView.image = UIImage(systemName: "repeat.circle")
        welcomeImageView.contentMode = .scaleAspectFit
        welcomeImageView.tintColor = .red
        return welcomeImageView
    }()
    
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
    
    let selectedColorView: UIView = {
        let col = UIView()
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = .systemGray3
        col.layer.shadowColor = UIColor.black.cgColor
        col.layer.shadowOffset = CGSize(width: 0, height: 2)
        col.layer.shadowOpacity = 0.2
        col.layer.shadowRadius = 4
        return col
    }()
    

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
//        stackView.backgroundColor = .green
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.clipsToBounds = true
        
        // Добавляем контейнеры в stackView
        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(containerView1)
        
        // Добавляем stackView в contentView
        contentView.addSubview(stackView)
        
        // Добавляем элементы в containerView
        containerView.addSubview(selectedColorView)
        containerView.addSubview(welcomeImageView)
        containerView.addSubview(messageLabel)
        
        containerView1.addSubview(switchButton)
        containerView1.addSubview(messageLabel1)
        containerView1.addSubview(welcomeImageView1)
//        containerView.addSubview(habitView.selectedColorView)
        
        layout()
//
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleColorTap))
       selectedColorView.addGestureRecognizer(tapGesture)
      selectedColorView.isUserInteractionEnabled = true
    }
    @objc private func handleColorTap() {
        // Сообщаем делегату или вызываем функцию нажатия
        onColorViewTapped?()
    }

    // Создаем замыкание для обработки нажатия
    var onColorViewTapped: (() -> Void)?
    
    var onColorChange: ((UIColor) -> Void)?

      // Инициализация...
      

      func updateSelectedColor(_ color: UIColor) {
          selectedColorView.backgroundColor = color
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        // Размещение stackView в contentView
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
            make.height.equalTo(40) // Высота stackView
        }
        
        // Размещение элементов внутри containerView
        selectedColorView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.width.height.equalTo(30)
        }
        
        welcomeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.width.height.equalTo(30)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
//            make.centerY.equalToSuperview()
            make.leading.equalTo(welcomeImageView.snp.trailing).offset(-10)
            make.trailing.equalTo(selectedColorView.snp.leading).offset(-10)
        }
        
        switchButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-23)
            make.width.height.equalTo(30)
        }
        messageLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(10)
            make.leading.equalTo(welcomeImageView1.snp.trailing).offset(1)
            make.trailing.equalTo(switchButton.snp.leading).offset(-1)
        }
        welcomeImageView1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.width.height.equalTo(30)
        }
    }
}
