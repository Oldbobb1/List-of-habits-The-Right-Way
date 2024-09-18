import UIKit
import ElementBuilder

class SetupCell1: UITableViewCell {
    
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"support" ,cornerRadius: 20, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "questionmark.bubble",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
//    
//    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle:"Оценка" ,cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "star.square",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//    
//    let buttonCloseUIView3 = ButtonsWithAction.makeButton(setTitle:"Подписка" ,cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "dollarsign.circle.fill",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//    
    
    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Guide" ,cornerRadius: 20, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "text.book.closed.fill",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
        
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 10 // Отступ между контейнерами
//        stackView.backgroundColor = .blue
        
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true 
        contentView.addSubview(stackView)
        contentView.addSubview(stackView1)
        
        stackView.addArrangedSubview(buttonCloseUIView)
//        stackView.addArrangedSubview(buttonCloseUIView3)
        
        stackView1.addArrangedSubview(buttonCloseUIView1)
        
        buttonCloseUIView.addTarget(self, action: #selector(openMailApp), for: .touchUpInside)
        buttonCloseUIView1.addTarget(self, action: #selector(openGuidancePresentation), for: .touchUpInside)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout(){
        
//        stackView.snp.makeConstraints { make in
//              make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
//              make.height.equalTo(60) // Высота stackView
//            make.width.equalToSuperview().inset(95)
//          }
        
        stackView.snp.makeConstraints { make in
              make.top.equalToSuperview().inset(1) // Отступ сверху
              make.leading.trailing.equalToSuperview().inset(1) // Горизонтальные отступы
//            make.trailing.equalToSuperview().inset(175)
              make.height.equalTo(60)// Высота stackView
            make.width.equalToSuperview().inset(80)
          }
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(-10) // Отступ сверху от stackView
//              make.leading.trailing.equalToSuperview().inset(1) // Горизонтальные отступы
            make.trailing.equalToSuperview().inset(1)
            make.height.equalTo(60) // Высота stackView1
            make.bottom.equalToSuperview().inset(1) // Отступ снизу
            make.width.equalToSuperview().inset(95)
        }
        
        
    }
    @objc func openMailApp() {
        let recipient = "therromanov@gmail.com", subject = "Suggestion"
        if let url = URL(string: "mailto:\(recipient)?subject=\(subject)") {
            UIApplication.shared.open(url)
        }
    }
    weak var view: SettingVC?
    
    @objc  func openGuidancePresentation() {
        let guidanceVC = GuidanceVC()
        let navigat = UINavigationController(rootViewController: guidanceVC)
        navigat.modalPresentationStyle = .fullScreen
        view?.present(navigat,animated: true, completion: nil)
    }

}







