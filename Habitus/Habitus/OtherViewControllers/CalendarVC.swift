import SwiftUI
import UIKit

import ElementBuilder


class CalendarViewController: UIViewController {
    
  
    
    let stack = StackView.stackView(axis: .horizontal, cornerRadius: 15)
        
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
        containerView.layer.cornerRadius = 15
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
    
    let completeLabel = Label.label(text: "0 Days Complete", fontSize: 15, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let lostLabel = Label.label(text: "0 Days lost", fontSize: 15, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)

    let containerView1: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 15
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    let scoreLabel = Label.label(text: "Points Accumulated: \n 0", fontSize: 15, weight: .regular, textColor: nil, textAlignment: .center, backgroundColor: .clear)
        
    let buttonScoreApply = ButtonsWithAction.makeButton(setTitle: "Write off Points",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.6,shadowRadius: 4)
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
       
        view.addSubview(label)
//   
//        view.addSubview(table)
//        table.delegate = self
//        table.dataSource = self
        
//        view.addSubview(containerView)
        containerView.addSubview(greenCircle)
        containerView.addSubview(redCircle)
        containerView.addSubview(completeLabel)
        containerView.addSubview(lostLabel)
        
        view.addSubview(containerView1)
        containerView1.addSubview(scoreLabel)
        

        view.addSubview(buttonScoreApply)
        
        view.addSubview(stack)
        stack.addArrangedSubview(containerView)
        stack.addArrangedSubview(containerView1)
        
        Layout.applyView(stack, view: view,topOffset: 90, leadingOffset: 10, trailingOffset: -10, additionalConstraints: {make in
            make.width.equalTo(100)
            make.height.equalTo(120)
        })
        
 
        
        Layout.applyView(label, view: view, topOffset: 0.85, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(containerView, view: stack,additionalConstraints: {make in
            make.trailing.equalTo(self.containerView1.snp.leading).offset(-10)
             make.width.equalTo(180)
            make.height.equalTo(80)
        })

        greenCircle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(20)
            make.width.height.equalTo(10)
        }
        
        completeLabel.snp.makeConstraints { make in
            make.leading.equalTo(greenCircle.snp.trailing).offset(15)
            make.centerY.equalTo(greenCircle.snp.centerY)
        }
        
        redCircle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(greenCircle.snp.bottom).offset(20)
            make.width.height.equalTo(10)
        }
        
        lostLabel.snp.makeConstraints { make in
            make.leading.equalTo(redCircle.snp.trailing).offset(15)
            make.centerY.equalTo(redCircle.snp.centerY)
        }
        
        Layout.applyView(containerView1, view: stack, additionalConstraints: {make in
            make.width.equalTo(180)
            make.height.equalTo(80)
        })
        
        Layout.applyView(scoreLabel, view: containerView1, topOffset: 15, leadingOffset: 10)
                
        Layout.applyView(buttonScoreApply, view: view,topOffset: 240, leadingOffset: 10,trailingOffset: -10, additionalConstraints: {make in
//            make.height.equalTo(59)
//            make.width.equalTo(180)
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
