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
        
    let container = containerView(backgroundColor:.systemGray6,cornerRadius: 20,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    

    let selectedColorView = ButtonsWithAction.makeButton( cornerRadius: 15,clipsToBounds: false,backgroundColor: .systemGray6,shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, spacing: 10, layoutMargins: .init(top: 10, left: 5, bottom: 10, right: 5))
    
    weak var habitVC: HabitVC?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(container)

        container.addSubview(selectedColorView)
        container.addSubview(welcomeImageView)
        container.addSubview(messageLabel)

        layout()
    
        selectedColorView.addAction(UIAction { [weak self] _ in
                    guard let self = self, let habitVC = self.habitVC else { return }
                    habitVC.showColorPicker(for: self)  // Передаем текущую ячейку
                }, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


//selectedColorView.addAction(UIAction{[weak self] _ in
//    guard let self = self else { return }
//    self.habitVC?.showColorPicker(for: self)
//}, for: .touchUpInside)



//@objc private func handleColorTap() {
//        // Сообщаем делегату или вызываем функцию нажатия
//        onColorViewTapped?()
//    }
//
//    // Создаем замыкание для обработки нажатия
//    var onColorViewTapped: (() -> Void)?
//
//    func updateSelectedColor(_ color: UIColor) {
//        selectedColorView.backgroundColor = color
//    }
  
//let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleColorTap))
//        selectedColorView.addGestureRecognizer(tapGesture)
//        selectedColorView.isUserInteractionEnabled = true
   

//    let selectedColorView: UIView = {
//        let col = UIView()
//        col.layer.cornerRadius = 15
//        col.translatesAutoresizingMaskIntoConstraints = false
//        col.backgroundColor = .systemGray4
//        col.layer.shadowColor = UIColor.darkGray.cgColor
//        col.layer.shadowOffset = CGSize(width: 0, height: 0)
//        col.layer.shadowOpacity = 1
//        col.layer.shadowRadius = 3
//        return col
//    }()
    
