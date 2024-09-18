import UIKit
import SnapKit
import ElementBuilder


class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name", cornerRadius: 10, clipsToBounds: false)

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
//        stackView.spacing = 10 // Отступ между контейнерами
//        stackView.backgroundColor = .green
        
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
//        contentView.addSubview(textField)
        contentView.addSubview(stackView)
        contentView.clipsToBounds = true
        stackView.addArrangedSubview(textField)
        
//        contentView.addSubview(containerView)
//        contentView.addSubview(containerView1)
//        containerView.addSubview(greenCircle)
  
//        textField.contentMode = .scaleAspectFill
        textField.backgroundColor = .systemGray6
//        textField.backgroundColor = .systemCyan.withAlphaComponent(0.6)
//        textField.layer.borderColor = UIColor.red.cgColor
//        textField.layer.borderWidth = 1
//        textField.layer.cornerRadius = 20
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 3)
        textField.layer.shadowOpacity = 0.8
        textField.layer.shadowRadius = 4
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
            make.height.equalTo(65) // Высота stackView
        }

//        Layout.applyView(textField, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8, additionalConstraints: {make in
            
//            make.height.equalTo(50)
//        })
        
//        Layout.applyView(containerView, view: contentView,topOffset: 8, leadingOffset: 10, additionalConstraints: {make in
//            make.width.equalTo(150)
//            make.height.equalTo(80)
//        })
//        
//        Layout.applyView(containerView1, view: contentView,topOffset: 8, trailingOffset: -10, additionalConstraints: {make in
//            make.width.equalTo(150)
//            make.height.equalTo(80)
//        })
//        
//        greenCircle.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(5)
//            make.top.equalToSuperview().offset(20)
//            make.width.height.equalTo(10)
//        }
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}




