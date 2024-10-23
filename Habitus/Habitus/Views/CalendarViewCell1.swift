import UIKit
import ElementBuilder


class CalendarViewCell1: UITableViewCell {
    
    let image: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(systemName: "exclamationmark.triangle.fill")
           return image
       }()
    
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let container = containerView(backgroundColor:.systemGray6,cornerRadius: 25,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    let completeLabel = Label.label(text: "missed days", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let image1: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(systemName: "trophy.fill")
           return image
       }()
    
    let completeLabel1 = Label.label(text: "best month", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel1 = Label.label(text: "- -", fontSize: 20, weight: .bold, textColor: .black, textAlignment: .center, backgroundColor: .clear)

    let container1 = containerView(backgroundColor:.systemGray6,cornerRadius: 25,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stack)
        stack.addArrangedSubview(container)
        container.addSubview(image)
        container.addSubview(completeLabel)
        container.addSubview(lostLabel)
        
        stack.addArrangedSubview(container1)
        container1.addSubview(image1)
        container1.addSubview(completeLabel1)
        container1.addSubview(lostLabel1)
    
        layuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func  layuot() {
        
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(150)
        }
        
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        lostLabel.snp.makeConstraints { make in
            make.top.equalTo(self.image.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            
        }
        
        completeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.lostLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
        }
        
        image1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
        
        lostLabel1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(self.image1.snp.bottom).offset(20)
        }
        
        completeLabel1.snp.makeConstraints { make in
            make.top.equalTo(self.lostLabel1.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
}
