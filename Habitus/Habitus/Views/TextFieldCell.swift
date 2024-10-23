import UIKit
import SnapKit
import ElementBuilder


class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(placeholder: "  habit name", cornerRadius: 10, backgroundColor: .systemGray6, clipsToBounds: false, shadowColor: UIColor.darkGray.cgColor, shadowOffset: .init(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3)

    let stackView = StackView.stackView(axis: .horizontal,distribution: .fillEqually,spacing: 10,layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(stackView)
        contentView.clipsToBounds = true
        stackView.addArrangedSubview(textField)
        
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
    }
    
    func configure(text: String?, delegate: UITextFieldDelegate, color: UIColor?) {
        textField.text = text
        textField.delegate = delegate
    }
}




