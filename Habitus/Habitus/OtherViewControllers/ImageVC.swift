import UIKit
import ElementBuilder


class ImagePresentViewController: UIViewController {
    
    var imageView: UIImageView!
    var imageName: String?
    var currentIndex = 0
    var totalPages = 0
    var descriptionLabel: UILabel!
    var imageShape: ImageShape = .square
    var imageDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureUI()
    }
    
    func configureUI() {
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel = Label.label(text:imageDescription, fontSize: 15, weight: .bold, textColor: .label, textAlignment: .center, backgroundColor: .systemBackground)
        
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
      
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        
        switch imageShape {
        case .square:
            setupSquareImageConstraints()
        case .circle:
            setupCircularImageConstraints()
        }
        setupDescriptionLabelConstraints()
    }
    // Методы для установки constraints для квадратного и круглого изображений
    private func setupSquareImageConstraints() {
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
//            make.width.equalTo(800)
            make.height.equalTo(460)
        })
    }
    
    private func setupCircularImageConstraints() {
        imageView.layer.cornerRadius = 150
        imageView.layer.masksToBounds = true// Половина ширины (или высоты) для круглого изображения
        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        })
    }
    
    private func setupDescriptionLabelConstraints() {
        Layout.applyView(descriptionLabel, view: view, additionalConstraints: { [self] (make) in
             make.top.equalTo(imageView.snp.bottom).offset(15)
             make.leading.equalTo(view.snp.leading).offset(20)
             make.trailing.equalTo(view.snp.trailing).offset(-20)
//             make.bottom.lessThanOrEqualTo(view.snp.bottom).offset(-20)
         })
     }
}
