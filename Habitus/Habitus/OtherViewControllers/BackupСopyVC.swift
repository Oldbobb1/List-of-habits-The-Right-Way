import SwiftUI
import UIKit
import ElementBuilder


class BackupСopyVC: UIViewController {
    
//    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle: "Close",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
        let buttonCloseUIView = ButtonsWithAction.makeButton(backgroundColor: .clear, systemName: "chevron.compact.backward", setImage: nil, imageSize: CGSize(width: 38, height: 25),alpha: 1)

   
    let label = Label.label(text: "Backup Сopy", fontSize: 20, weight: .heavy, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
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
    
    let label1 = Label.label(text:"Здесь будет нужное описание", fontSize: 20, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)

    let image: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(systemName: "arrow.clockwise.square.fill") // Замена на системное изображение для проверки
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
    
    let buttonCopy = ButtonsWithAction.makeButton(setTitle: "Создать сейчас",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let buttonCopy1 = ButtonsWithAction.makeButton(setTitle: "Создавать автоматически: ",cornerRadius: 15,setTitleColor: .black, clipsToBounds: false, backgroundColor: .systemGray6,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.2,shadowRadius: 4)
    
    let label2 = Label.label(text:"Последняя резервная копия: Нет", fontSize: 18, weight: .regular, textColor: .black, textAlignment: .center, backgroundColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
 
        view.addSubview(label)
        
        Layout.applyView(label, view: view, topOffset: 4, leadingOffset: 0, trailingOffset: 0)
        
        view.addSubview(buttonCloseUIView)
        view.addSubview(containerView)
        containerView.addSubview(label1)
        containerView.addSubview(image)
        view.addSubview(buttonCopy)
        view.addSubview(label2)
        view.addSubview(buttonCopy1)
        
        Layout.applyView(buttonCloseUIView, view: view, topOffset: 4, leadingOffset: 10, additionalConstraints: {make in
//            make.width.equalTo(100)
        })
        Layout.applyView(containerView, view: view,topOffset: 70, leadingOffset: 30, trailingOffset: -30, additionalConstraints: {make in
            make.height.equalTo(220)
        })
        
        Layout.applyView(label1, view: containerView, topOffset: 100, leadingOffset: 5, trailingOffset: -5)
        
        Layout.applyView(image, view: containerView, topOffset: 10, leadingOffset: 10,trailingOffset: -10, additionalConstraints: {make in
            make.height.equalTo(80)
        })
        
        Layout.applyView(buttonCopy, view: view, topOffset: 380, leadingOffset: 30, trailingOffset: -30)
        
        Layout.applyView(buttonCopy1, view: view, topOffset: 430, leadingOffset: 30, trailingOffset: -30)
        
        Layout.applyView(label2, view: view, topOffset: 320, leadingOffset: 30, trailingOffset: -30)
    
        buttonCopy1.addTarget(self, action: #selector(showSubscriptionOptions), for: .touchUpInside)
    }

    @objc func showSubscriptionOptions() {
          let alertController = UIAlertController(title: "Выберите подписку", message: nil, preferredStyle: .actionSheet)
          
          let option1 = UIAlertAction(title: "Ежедневно", style: .default) { [weak self] _ in
              self?.updateButtonTitle(with: "Ежедневно")
          }
          let option2 = UIAlertAction(title: "Eженедельно", style: .default) { [weak self] _ in
              self?.updateButtonTitle(with: "Еженедельно")
          }
          let option3 = UIAlertAction(title: "Eжемесячно", style: .default) { [weak self] _ in
              self?.updateButtonTitle(with: "Ежемесячно")
          }
          let option4 = UIAlertAction(title: "Выкл.", style: .default) { [weak self] _ in
              self?.updateButtonTitle(with: "Выкл.")
          }
          let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
          
          alertController.addAction(option1)
          alertController.addAction(option2)
          alertController.addAction(option3)
          alertController.addAction(option4)
          alertController.addAction(cancelAction)
          
          self.present(alertController, animated: true, completion: nil)
      }
    
    private func updateButtonTitle(with option: String) {
        self.buttonCopy1.setTitle("Создавать автоматически: \(option)", for: .normal)
    }
}




struct ViewControllerProvider8: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            BackupСopyVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
