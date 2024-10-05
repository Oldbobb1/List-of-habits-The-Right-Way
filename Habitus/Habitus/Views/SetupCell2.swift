import UIKit
import ElementBuilder
//import AuthenticationServices


class SetupCell2: UITableViewCell {

    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Backup" ,cornerRadius: 18, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 1 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
       
        stackView.addArrangedSubview(buttonCloseUIView1)

        layout()
        
//        buttonCloseUIView1.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        buttonCloseUIView1.addTarget(self, action: #selector(showBackupVC), for: .touchUpInside)
        
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

    weak var views: SettingVC?

    @objc func showAlert() {
        let alertController = UIAlertController(title: "Уведомление", message: "доступно после авторизации через эпл айди", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        views?.present(alertController, animated: true, completion: nil)
    }
    
    @objc func showBackupVC() {
        let backup = BackupСopyVC()
        backup.modalPresentationStyle = .fullScreen
        views?.present(backup,animated: true, completion: nil)
    }
}
    
