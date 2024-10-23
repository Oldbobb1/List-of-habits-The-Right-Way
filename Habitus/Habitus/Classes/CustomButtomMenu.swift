import UIKit
import ElementBuilder
import SwiftUI


class CustomButtomMenu: UIView {
    
    let customBar = containerView(backgroundColor:.systemGray6,cornerRadius: 25,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .horizontal,distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 25, spacing: 6, layoutMargins: .init(top: 2, left: 3, bottom: -5, right: 3))
    
    let openHabitVC = ButtonsWithAction.makeButton(cornerRadius: 20,clipsToBounds: false, backgroundColor: .systemGray6,systemName: "plus.circle", setImage: nil,imageSize: CGSize(width: 28, height: 28) ,alpha: 1,shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3, tintColor: .black)
    
    let openListVC = ButtonsWithAction.makeButton(cornerRadius: 20,clipsToBounds: false, backgroundColor: .systemGray6,systemName:"list.bullet.circle", setImage: nil,imageSize: CGSize(width: 28, height: 28) ,alpha: 1,shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3, tag: 1, tintColor: .black)
    
    let openNotesVC = ButtonsWithAction.makeButton(cornerRadius: 20,clipsToBounds: false, backgroundColor: .systemGray6,systemName:"pencil.circle", setImage: nil,imageSize: CGSize(width: 28, height: 28) ,alpha: 1,shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3, tag: 2,tintColor: .black)
    
    let openStatisticsVC = ButtonsWithAction.makeButton( cornerRadius: 20,clipsToBounds: false,backgroundColor: .systemGray6,systemName: "chart.line.uptrend.xyaxis.circle", setImage: nil,imageSize: CGSize(width:28,height:28) ,alpha: 1, shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3, tag: 3, tintColor: .black)
    
    let openSettingVC = ButtonsWithAction.makeButton( cornerRadius: 20,clipsToBounds: false,backgroundColor: .systemGray6,systemName: "gear", setImage: nil,imageSize: CGSize(width:28, height: 28) ,alpha: 1, shadowColor: UIColor.darkGray.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 1, shadowRadius: 3, tag: 4, tintColor: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
        
    private func setupView() {
        addSubview(customBar)
        customBar.addSubview(stackView)
        
        stackView.addArrangedSubview(openHabitVC)
        stackView.addArrangedSubview(openListVC)
        stackView.addArrangedSubview(openNotesVC)
        stackView.addArrangedSubview(openStatisticsVC)
        stackView.addArrangedSubview(openSettingVC)
    
        layout()
    }
    
    func layout() {
        customBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(customBar).inset(5)
        }
    }
    
}

