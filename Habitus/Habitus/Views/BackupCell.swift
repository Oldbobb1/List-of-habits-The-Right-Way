import UIKit
import ElementBuilder


class BackupCell: UITableViewCell {
    
    let container = containerView(backgroundColor:.systemGray6,cornerRadius: 18,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    let label1 = Label.label(text:"Здесь будет нужное описание", fontSize: 20, weight: .regular, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.clockwise.square.fill") // Замена на системное изображение для проверки
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label2 = Label.label(text:"Последняя резервная копия: Нет", fontSize: 18, weight: .regular, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    
    let stackView = StackView.stackView(axis: .vertical,distribution: .fillProportionally,backgroundColor: .clear, cornerRadius: 10, spacing: 20, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))
    
    let container1 = containerView(backgroundColor:.systemGray6,cornerRadius: 18,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(container)
        container.addSubview(label1)
        container.addSubview(image)
        
      stackView.addArrangedSubview(container1)
        
        container1.addSubview(label2)
        
        layuot()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layuot() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(350)
        }
        
        container.snp.makeConstraints { make in
            make.height.equalTo(100) // Устанавливаем высоту второго контейнера меньше чем у первого
        }
        
        container1.snp.makeConstraints { make in
            make.height.equalTo(50) // Устанавливаем высоту второго контейнера меньше чем у первого
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(self.image.snp.top).offset(100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.width.equalTo(70)
        }
        
        label2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.trailing.equalToSuperview().offset(-10)
        }
    }

}
