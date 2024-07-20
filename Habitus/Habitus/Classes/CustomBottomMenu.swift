import UIKit
import ElementBuilder


class CustomButtomMenu: UIView {
    
    let stackView = StackView.stackView(axis: .horizontal,distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 30)
    
    var openListVC = ButtonsWithAction.makeButton(cornerRadius: 360,clipsToBounds: false, backgroundColor: .clear,systemName:"list.bullet.circle", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1)
    
    var openNotesVC = ButtonsWithAction.makeButton(cornerRadius: 360,clipsToBounds: false, backgroundColor: .clear,systemName:"pencil.circle", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1)
    
    var openSettingVC = ButtonsWithAction.makeButton(backgroundColor: .clear,systemName: "gear", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(openListVC)
        addSubview(openNotesVC)
        addSubview(openSettingVC)
        addSubview(stackView)
        stackView.addArrangedSubview(openListVC)
        stackView.addArrangedSubview(openNotesVC)
        stackView.addArrangedSubview(openSettingVC)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
