import SwiftUI
import UIKit
import ElementBuilder


class CalendarViewController: UIViewController {

    let label = Label.label(text: "Stats", fontSize: 25, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"info.circle", setImage: nil,imageSize: CGSize(width: 29, height: 28) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 0.6, shadowRadius: 3, tintColor: .black)
    
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

        table.register(CalendarViewCell.self, forCellReuseIdentifier: "Cell")
        table.register(CalendarViewCell1.self, forCellReuseIdentifier: "Cell1")
        table.register(CalendarViewCell2.self, forCellReuseIdentifier: "Cell2")
        table.register(CalendarViewCell3.self, forCellReuseIdentifier: "Cell3")
        table.register(CalendarViewCell4.self, forCellReuseIdentifier: "Cell4")

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






















