import UIKit
import ElementBuilder

class SetupCell1: UITableViewCell {
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"support" ,cornerRadius: 18, content: .center,  setTitleColor: .label,font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, shadowColor:UIColor.darkGray.cgColor,shadowOffset: CGSize(width: -1, height: -1), shadowOpacity: 1, shadowRadius: 3)

    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Star" ,cornerRadius: 18, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6,shadowColor:UIColor.darkGray.cgColor,shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 1, shadowRadius: 3)
        
    let stackView = StackView.stackView(axis: .vertical, distribution: .fillEqually, backgroundColor: .clear, spacing: 1, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    weak var views: SettingVC?
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true 
        contentView.addSubview(stackView)
    
        buttonCloseUIView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        buttonCloseUIView1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        stackView.addArrangedSubview(buttonCloseUIView)        
        stackView.addArrangedSubview(buttonCloseUIView1)

        buttonCloseUIView.addAction(UIAction(handler: {[weak self] _ in
            guard let self = self  else {return}
            self.openMailApp()
        }), for: .touchUpInside)
        
        buttonCloseUIView1.addAction(UIAction(handler: {[weak self] _ in
            guard let self = self  else {return}
            self.showAlert()
        }), for: .touchUpInside)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
            //              make.top.equalToSuperview().inset(1) // Отступ сверху
            make.leading.trailing.equalToSuperview().inset(50) // Горизонтальные отступы
            //            make.trailing.equalToSuperview().inset(175)
            make.height.equalTo(100)// Высота stackView
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        views?.present(alertController, animated: true, completion: nil)
    }
    
     func openMailApp() {
        let recipient = "therromanov@gmail.com", subject = "Suggestion"
        if let url = URL(string: "mailto:\(recipient)?subject=\(subject)") {
            UIApplication.shared.open(url)
        }
    }
}







