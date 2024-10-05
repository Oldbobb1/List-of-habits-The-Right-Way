import UIKit
import ElementBuilder


class DaysCell: UITableViewCell {
    
    var selectedDays = [Int]()
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    let stackView = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10, spacing: 5, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.addSubview(stackView)
        
        createButton()
        layuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton() {
        for (_, day) in days.enumerated() {
            let dayButton = ButtonsWithAction.makeButton(setTitle: day,cornerRadius: 10,content: .center,setTitleColor: .label,clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.8,shadowRadius: 4)
            
            stackView.addArrangedSubview(dayButton)
            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
    }
    
    func layuot() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
            make.height.equalTo(60) // Высота stackView
        }
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }
        if index ==  0  {
            if  selectedDays.count == days.count - 1 {
                selectedDays.removeAll()
            } else {
                selectedDays = Array(1..<days.count)
            }
        } else {
            if selectedDays.contains(index) {
                selectedDays.removeAll(where: { $0 == index })
            } else {
                selectedDays.append(index)
            }
        }
        
        for (index, day) in days.enumerated() {
            guard let button = sender.superview?.subviews.compactMap({ $0 as? UIButton }).first(where: { $0.titleLabel?.text == day }) else { continue }
            if selectedDays.contains(index) {
                button.backgroundColor = .systemBlue
                button.layer.shadowColor = UIColor.systemBlue.cgColor
                
            } else {
                button.backgroundColor = .systemGray6
                button.layer.shadowColor = UIColor.gray.cgColor
            }
            
        }
    }
    
    func configure(selectedDays: [Int]) {
        self.selectedDays = selectedDays
    }
    
}



