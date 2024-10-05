import UIKit
import ElementBuilder


class TexеCell: UITableViewCell {
    
    let messageLabel = Label.label(text: "Color", fontSize: 20, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)
        
    let welcomeImageView: UIImageView = {
        let welcomeImageView = UIImageView()
        welcomeImageView.image = UIImage(systemName: "paintbrush.fill")
        welcomeImageView.contentMode = .scaleAspectFit
        welcomeImageView.tintColor = .red
        return welcomeImageView
    }()
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 20
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()

    let selectedColorView: UIView = {
        let col = UIView()
        col.layer.cornerRadius = 15
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = .systemGray4
        col.layer.shadowColor = UIColor.gray.cgColor
        col.layer.shadowOffset = CGSize(width: 1, height: 2)
        col.layer.shadowOpacity = 0.6
        col.layer.shadowRadius = 4
        return col
    }()
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 10 // Отступ между контейнерами
        //        stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5) // Отступы от границ stackView
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        

        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(containerView)

        containerView.addSubview(selectedColorView)
        containerView.addSubview(welcomeImageView)
        containerView.addSubview(messageLabel)

        layout()
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleColorTap))
        selectedColorView.addGestureRecognizer(tapGesture)
        selectedColorView.isUserInteractionEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleColorTap() {
        // Сообщаем делегату или вызываем функцию нажатия
        onColorViewTapped?()
    }
    
    // Создаем замыкание для обработки нажатия
    var onColorViewTapped: (() -> Void)?
    
    func updateSelectedColor(_ color: UIColor) {
        selectedColorView.backgroundColor = color
    }
    
    func layout() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
            make.height.equalTo(65) // Высота stackView
        }
        
        selectedColorView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.trailing.equalToSuperview().offset(-9)
            make.width.height.equalTo(30)
        }
        
        welcomeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.equalToSuperview().offset(7)
            make.width.height.equalTo(30)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(welcomeImageView.snp.trailing).offset(-10)
            make.trailing.equalTo(selectedColorView.snp.leading).offset(-5)
        }
    }
}


