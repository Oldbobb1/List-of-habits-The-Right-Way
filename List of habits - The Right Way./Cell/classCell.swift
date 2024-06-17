//  classCell.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
//        addSubview(circleView)
        addSubview(buttonStackView)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-150)
        }
        
//        circleView.snp.makeConstraints { make in
//            make.width.height.equalTo(30)
//            make.left.equalToSuperview().offset(10)
//            make.centerY.equalToSuperview()
//        }
        
        buttonStackView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        _ = (1...3).map { _ -> UIButton in
            let button = UIButton()
            button.setTitle("x", for: .normal)
            button.setTitleColor(.gray, for: .normal)
            buttonStackView.addArrangedSubview(button)
            return button
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(object: Emoji) {
        nameLabel.text = object.name
        nameLabel.numberOfLines = 2
    }
}

