import SwiftUI
import UIKit

import ElementBuilder


//В экране статистики: обьяснение как работает подсчет и количевство 
//
//Каждый месяц  - это  96%
//
//Каждый месяц в году - это  8%
//
//3 раза в неделю весь месяц - это 100% ( неделя 24% )
//
//4-7 раз в неделю весь месяц это 100%  (32 - 56% )
//
//1-2 раза в неделю весь месяц это 100% (8 - 16% )
//
//
//Неделя пропуска отнимает две недели действий
//
//Месяц пропуска отнимает два месяца действий
//
//Одно действие это 2% - при 3/7
//При  4-7 / 7 одно действие это 1%


//Лэйбл процентов  ( неделя , месяц , год )
//
         //Лэйбл выполненых и пропущенных дней -> есть
//
        //Статистика за каждую неделю, месяц, год  -> есть



class CalendarViewController: UIViewController {

    let label = Label.label(text: "Stats", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"info.circle", setImage: nil,imageSize: CGSize(width: 29, height: 28) ,alpha: 1,shadowColor: UIColor.systemRed.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4, tintColor: .black)
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemPink.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemBlue.withAlphaComponent(0.8).cgColor,
            UIColor.systemPink.withAlphaComponent(0.8).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()

    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    private func setupGradientBackground1() {
           let backgroundView = UIView(frame: table.bounds)
           backgroundView.layer.insertSublayer(gradientLayer1, at: 0)

        table.backgroundView = backgroundView
       }
    
    let table = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer1.frame = table.bounds
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientBackground()
        setupGradientBackground1()
       
        view.addSubview(label)
        view.addSubview(table)
        view.addSubview(buttonCloseUIView)
        
        table.dataSource = self
        table.delegate = self
        table.layer.cornerRadius = 25
        table.showsVerticalScrollIndicator = false

        table.register(Cell1.self, forCellReuseIdentifier: "Cell")
        table.register(Cell2.self, forCellReuseIdentifier: "Cell1")
        table.register(Cell3.self, forCellReuseIdentifier: "Cell2")
        table.register(Cell4.self, forCellReuseIdentifier: "Cell3")
        table.register(Cell5.self, forCellReuseIdentifier: "Cell4")

        Layout.applyView(label, view: view, topOffset: 0.85, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(buttonCloseUIView, view: view, additionalConstraints: {make in
            make.trailing.equalTo(self.label.snp.trailing).offset(5)
            make.top.equalTo(self.label.snp.top).offset(1)
        })
        
        Layout.applyView(table, view: view,leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
                        make.top.equalTo(self.label.snp.bottom).offset(30)
            make.bottom.equalTo(0)
        })
    }
}




struct ViewControllerProvider6: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            CalendarViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}



extension CalendarViewController: UITableViewDelegate { }



extension CalendarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Возвращаем текст заголовка для каждой секции
        switch section {
        case 2:
            return "Stats of Week"
        case 3:
            return "Stats of Month"
        case 4:
            return "Stats of Years"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30 // Высота заголовка
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3,4:
            return 1
        default:
            return 0
        }
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell1
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            
            return cell 
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! Cell2
            cell1.selectionStyle = .none
            cell1.backgroundColor = .clear
            return cell1
        case 2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! Cell3
            cell2.selectionStyle = .none
            cell2.backgroundColor = .clear
            return cell2
        case 3:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! Cell4
            cell3.selectionStyle = .none
            cell3.backgroundColor = .clear
            return cell3
        case 4:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! Cell5
            cell4.selectionStyle = .none
            cell4.backgroundColor = .clear
            return cell4
        default:
        return UITableViewCell()
        }
    }
    
}



class Cell1: UITableViewCell {
    
    let image: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(systemName: "rosette")
           return image
       }()
    
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let containerView: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()
    
    let completeLabel = Label.label(text: "days completed", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let image1: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(systemName: "crown.fill")
           return image
       }()
    
    let scoreLabel = Label.label(text: "longest streak", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel1 = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let containerView1: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stack)
        stack.addArrangedSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(completeLabel)
        containerView.addSubview(lostLabel)

        stack.addArrangedSubview(containerView1)
        containerView1.addSubview(image1)
        containerView1.addSubview(scoreLabel)
        containerView1.addSubview(lostLabel1)

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
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(self.lostLabel1.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
        }
    }
}



class Cell2: UITableViewCell {
    
    let image: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(systemName: "exclamationmark.triangle.fill")
           return image
       }()
    
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let containerView: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()
    
    let completeLabel = Label.label(text: "missed days", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let image1: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(systemName: "trophy.fill")
           return image
       }()
    
    let completeLabel1 = Label.label(text: "best month", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel1 = Label.label(text: "- -", fontSize: 20, weight: .bold, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let containerView1: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
           containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stack)
        stack.addArrangedSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(completeLabel)
        containerView.addSubview(lostLabel)
        
        stack.addArrangedSubview(containerView1)
        containerView1.addSubview(image1)
        containerView1.addSubview(completeLabel1)
        containerView1.addSubview(lostLabel1)
    
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



class Cell3: UITableViewCell {
    
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let containerView: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stack)
        stack.addArrangedSubview(containerView)
        
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


class Cell4: UITableViewCell {
 
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let containerView: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stack)
        stack.addArrangedSubview(containerView)
       
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


class Cell5: UITableViewCell {
    
    let stack = StackView.stackView(axis: .horizontal, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 10,spacing: 10, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let containerView: UIView = {
           let containerView = UIView()
           containerView.backgroundColor = .systemGray6
           containerView.layer.cornerRadius = 25
           containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
           containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
           containerView.layer.shadowOpacity = 0.6
           containerView.layer.shadowRadius = 4
           return containerView
       }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(stack)
        stack.addArrangedSubview(containerView)
       
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
