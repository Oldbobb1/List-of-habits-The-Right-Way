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
    

    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "rosette")
        return image
    }()
    
    let image1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "crown.fill")
        return image
    }()
    
   
    
    let image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "exclamationmark.triangle.fill")
        return image
    }()
        
    let image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "trophy.fill")
        return image
    }()
    
    
    
    
    let stack = StackView.stackView(axis: .horizontal, backgroundColor: .red, cornerRadius: 25)
    
    let stack1 = StackView.stackView(axis: .horizontal, backgroundColor: .red, cornerRadius: 25)
    
    let stack2 = StackView.stackView(axis: .horizontal, backgroundColor: .red, cornerRadius: 25)
    
    let stack3 = StackView.stackView(axis: .horizontal, backgroundColor: .red, cornerRadius: 25)
    
    let stack4 = StackView.stackView(axis: .horizontal, backgroundColor: .red, cornerRadius: 25)
        
        
        
    let label = Label.label(text: "Stats", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    var selectedDates =  [Date]()
    
//    let table: UITableView = {
//        let table = UITableView()
//        table.backgroundColor = .red
//        return table
//    }()
    
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
    
    let greenCircle: UIView = {
        let greenCircle = UIView()
        greenCircle.backgroundColor = .black
        greenCircle.layer.cornerRadius = 5
        greenCircle.translatesAutoresizingMaskIntoConstraints = false
        return greenCircle
    }()
    
    let redCircle: UIView = {
        let redCircle = UIView()
        redCircle.backgroundColor = .black
        redCircle.layer.cornerRadius = 5
        redCircle.translatesAutoresizingMaskIntoConstraints = false
        return redCircle
    }()
    
    let completeLabel = Label.label(text: "days completed", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let completeLabel1 = Label.label(text: "missed days", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel2 = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel1 = Label.label(text: "0 Days", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel3 = Label.label(text: "- -", fontSize: 20, weight: .bold, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let completeLabel2 = Label.label(text: "best month", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)

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
    
    let scoreLabel = Label.label(text: "longest streak", fontSize: 15, weight: .light, textColor: .lightGray, textAlignment: .center, backgroundColor: .clear)
        
//    let buttonScoreApply = ButtonsWithAction.makeButton(setTitle: "Write off Points",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.6,shadowRadius: 4)
//    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let containerView2: UIView = {
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
    
    let containerView3: UIView = {
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
    
    let containerView4: UIView = {
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
    
    let containerView5: UIView = {
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

    let containerView6: UIView = {
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

    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemBlue.withAlphaComponent(0.8).cgColor,
            UIColor.systemPink.withAlphaComponent(0.8).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    // таблца
//    private let gradientLayer: CAGradientLayer = {
//        let gradient = CAGradientLayer()
//        gradient.colors = [
//            UIColor.systemPurple.withAlphaComponent(0.8).cgColor,
//            UIColor.systemOrange.withAlphaComponent(0.8).cgColor
//        ]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        return gradient
//    }()
    

    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    
    let name = Label.label(text: "Stats of week", fontSize: 25, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    let name1 = Label.label(text: "Stats of month", fontSize: 25, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    
    let name2 = Label.label(text: "Stats of years", fontSize: 25, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemBackground
        
        setupGradientBackground()
       
        view.addSubview(label)
        view.addSubview(name)
        view.addSubview(name1)
        view.addSubview(name2)
//
//        view.addSubview(table)
//        table.delegate = self
//        table.dataSource = self
        
//        view.addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(redCircle)
        containerView.addSubview(completeLabel)
        containerView.addSubview(lostLabel)
        
        view.addSubview(containerView1)
//        containerView1.addSubview(scoreLabel)
        containerView1.addSubview(scoreLabel)
        
        containerView1.addSubview(lostLabel1)
        containerView1.addSubview(image1)

//        view.addSubview(buttonScoreApply)
        
        view.addSubview(containerView2)
        view.addSubview(containerView3)
        
        view.addSubview(stack)
        stack.addArrangedSubview(containerView)
        stack.addArrangedSubview(containerView1)
        
        view.addSubview(stack1)
        stack1.addArrangedSubview(containerView2)
        stack1.addArrangedSubview(containerView3)
        
        containerView2.addSubview(completeLabel1)
        containerView2.addSubview(lostLabel2)
        containerView2.addSubview(image2)
        
        containerView3.addSubview(completeLabel2)
        containerView3.addSubview(lostLabel3)
        containerView3.addSubview(image3)
        
        view.addSubview(stack2)
        stack2.addArrangedSubview(containerView4)
        
        view.addSubview(stack3)
        view.addSubview(stack4)
        stack3.addArrangedSubview(containerView5)
        stack4.addArrangedSubview(containerView6)
        
        Layout.applyView(name, view: view, topOffset: 318, leadingOffset: 10)
        
        Layout.applyView(name1, view: view, topOffset: 470, leadingOffset: 10)
        
        Layout.applyView(name2, view: view, topOffset: 620, leadingOffset: 10)
        
        Layout.applyView(stack, view: view,topOffset: 50, leadingOffset: 10, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
            make.height.equalTo(120)
        })
        
        Layout.applyView(stack2, view: view,topOffset: 350, leadingOffset: 10, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
            make.height.equalTo(130)
        })
        
        Layout.applyView(stack1, view: view,topOffset: 190, leadingOffset: 10, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
            make.height.equalTo(120)
        })
        
        Layout.applyView(stack3, view: view,topOffset: 500, leadingOffset: 10, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
            make.height.equalTo(130)
        })
        
        Layout.applyView(stack4, view: view,topOffset: 650, leadingOffset: 10, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
            make.height.equalTo(130)
        })
        
        Layout.applyView(containerView2, view: stack,additionalConstraints: {make in
            make.trailing.equalTo(self.containerView3.snp.leading).offset(-10)
             make.width.equalTo(180)
            make.height.equalTo(80)
        })
        
 
        
        Layout.applyView(label, view: view, topOffset: 0.85, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(containerView, view: stack,additionalConstraints: {make in
            make.trailing.equalTo(self.containerView1.snp.leading).offset(-10)
             make.width.equalTo(180)
            make.height.equalTo(80)
        })

        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
                
        completeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
//            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        completeLabel1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
//            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        completeLabel2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
//            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-15)
        }
        
//        redCircle.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(5)
//            make.top.equalTo(greenCircle.snp.bottom).offset(20)
//            make.width.height.equalTo(10)
//        }
//        
//        lostLabel.snp.makeConstraints { make in
//            make.leading.equalTo(redCircle.snp.trailing).offset(15)
//            make.centerY.equalTo(redCircle.snp.centerY)
//        }
        
        lostLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(60)
        }
        
        lostLabel2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(60)
        }
        
        lostLabel3.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(60)
        }
        
        Layout.applyView(containerView1, view: stack, additionalConstraints: {make in
            make.width.equalTo(180)
            make.height.equalTo(80)
        })
        
        Layout.applyView(scoreLabel, view: containerView1, leadingOffset: 19, bottomOffset: -15)
        
        lostLabel1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.top.equalToSuperview().offset(60)
        }
        
        image1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(9)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
        
        image2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(9)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
        
        image3.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(9)
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }
        
//        Layout.applyView(buttonScoreApply, view: view,topOffset: 240, leadingOffset: 10,trailingOffset: -10, additionalConstraints: {make in
////            make.height.equalTo(59)
////            make.width.equalTo(180)
//        })
    
    }
 
}




struct ViewControllerProvider6: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            CalendarViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}



//extension CalendarViewController: UITableViewDelegate { }
//
//
//extension CalendarViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//}
