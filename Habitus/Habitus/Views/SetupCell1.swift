import UIKit
import ElementBuilder

class SetupCell1: UITableViewCell {
    
    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle:"Оценка" ,cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "star.square",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    let buttonCloseUIView3 = ButtonsWithAction.makeButton(setTitle:"Подписка" ,cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "dollarsign.circle.fill",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCloseUIView2)
        stackView.addArrangedSubview(buttonCloseUIView3)
        
        
        //        buttonCloseUIView.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        //        buttonCloseUIView1.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layout(){
        
        stackView.snp.makeConstraints { make in
              make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
              make.height.equalTo(40) // Высота stackView
          }
        
        
    }
}
