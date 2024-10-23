import UIKit
import ElementBuilder


class CalendarViewCell2: UITableViewCell {
    
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let container = containerView(backgroundColor:.systemGray6,cornerRadius: 25,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stack)
        stack.addArrangedSubview(container)
        
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
    }
}
