//  classCell.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit
import FSCalendar

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
    
    var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        //        stackView.backgroundColor = .blue
        return stackView
    }()
    
//   fileprivate weak var calendar: FSCalendar!
//    var calendar: FSCalendar!
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
//        calendarView = FSCalendar()
//        calendarView.delegate = self
//        calendarView.dataSource = self
//        calendarView.frame = bounds
//        addSubview(calendarView)
//    
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
            button.setTitleColor(.black, for: .normal)
            //            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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


extension EmojiTableViewCell: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // Здесь можно изменить внешний вид выбранной даты (например, появление галочки)
    }
}




