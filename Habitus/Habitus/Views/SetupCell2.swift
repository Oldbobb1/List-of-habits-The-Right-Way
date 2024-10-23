import UIKit
import ElementBuilder
//import AuthenticationServices


class SetupCell2: UITableViewCell {
    
    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Backup" ,cornerRadius: 18, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, shadowColor:UIColor.darkGray.cgColor,shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .vertical, distribution: .fillEqually, backgroundColor: .clear, spacing: 1, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    weak var views: SettingVC?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(buttonCloseUIView1)
        
        layout()

        buttonCloseUIView1.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            let backup = BackupСopyVC()
            backup.modalPresentationStyle = .fullScreen
            views?.present(backup,animated: true, completion: nil)
        }, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
            make.leading.trailing.equalToSuperview().inset(50) // Горизонтальные отступы
            make.height.equalTo(65)// Высота stackView
        }
        
    }
    
}

//@objc func showAlert() {
//    let alertController = UIAlertController(title: "Уведомление", message: "доступно после авторизации через эпл айди", preferredStyle: .alert)
//    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//    views?.present(alertController, animated: true, completion: nil)
//}
