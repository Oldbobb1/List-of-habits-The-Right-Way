import UIKit
import SnapKit
import ElementBuilder


class TextFieldCell: UITableViewCell {
    
    let textField = TextField.textField(  placeholder: "  habit name", cornerRadius: 10, clipsToBounds: false)

//    let containerView: UIView = {
//        let containerView = UIView()
//        containerView.backgroundColor = .systemGray6
//        containerView.layer.cornerRadius = 15
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        containerView.layer.shadowOpacity = 0.6
//        containerView.layer.shadowRadius = 4
//        return containerView
//    }()
//    
//    
//    let containerView1: UIView = {
//        let containerView = UIView()
//        containerView.backgroundColor = .systemGray6
//        containerView.layer.cornerRadius = 15
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        containerView.layer.shadowOpacity = 0.6
//        containerView.layer.shadowRadius = 4
//        return containerView
//    }()
//    
//    let greenCircle: UIView = {
//        let greenCircle = UIView()
//        greenCircle.backgroundColor = .red
//        greenCircle.layer.cornerRadius = 5
//        greenCircle.translatesAutoresizingMaskIntoConstraints = false
//        return greenCircle
//    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(textField)
        contentView.clipsToBounds = true
//        contentView.addSubview(containerView)
//        contentView.addSubview(containerView1)
//        containerView.addSubview(greenCircle)
  
        textField.contentMode = .scaleAspectFill
        textField.backgroundColor = .systemGray6
//        textField.layer.borderColor = UIColor.red.cgColor
//        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.6
        textField.layer.shadowRadius = 4
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        Layout.applyView(textField, view: contentView, topOffset: 8, leadingOffset: 10, trailingOffset: -10, bottomOffset: -8, additionalConstraints: {make in
            
//            make.height.equalTo(50)
        })
        
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




