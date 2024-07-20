import SwiftUI
import UIKit
import SnapKit
import StoreKit
import ElementBuilder


class SubscribeVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController!
    var slides: [UIViewController] = []
    var swipe: SwipeClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupPageViewController()
        setupSubscribeButton()
        swipeAct()
    }
    
    func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        slides = createSlides()
        
        if let firstViewController = slides.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.view.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        
        pageViewController.didMove(toParent: self)
    }
    
    func createSlides() -> [UIViewController] {
        let slide1 = SlideViewController()
        slide1.imageView.image = UIImage(named: "slide1")
        slide1.label.text = "Преимущество 1"
        
        let slide2 = SlideViewController()
        slide2.imageView.image = UIImage(named: "slide2")
        slide2.label.text = "Преимущество 2"
        
        let slide3 = SlideViewController()
        slide3.imageView.image = UIImage(named: "slide3")
        slide3.label.text = "Преимущество 3"
        
        return [slide1, slide2, slide3]
    }
    
    func setupSubscribeButton() {
        let subscribeButton = UIButton()
        subscribeButton.setTitle("Подписаться", for: .normal)
        subscribeButton.backgroundColor = .systemBlue
        subscribeButton.layer.cornerRadius = 10
        subscribeButton.addTarget(self, action: #selector(showSubscriptionOptions), for: .touchUpInside)
        
        view.addSubview(subscribeButton)
        
        subscribeButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func showSubscriptionOptions() {
        let alertController = UIAlertController(title: "Выберите подписку", message: nil, preferredStyle: .actionSheet)
        
        let option1 = UIAlertAction(title: "Месячная подписка", style: .default) { _ in
            print("Месячная подписка выбрана")
        }
        let option2 = UIAlertAction(title: "Годовая подписка", style: .default) { _ in
            print("Годовая подписка выбрана")
        }
        let option3 = UIAlertAction(title: "Пожизненная подписка", style: .default) { _ in
            print("Пожизненная подписка выбрана")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(option1)
        alertController.addAction(option2)
        alertController.addAction(option3)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UIPageViewController DataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = slides.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        return slides[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = slides.firstIndex(of: viewController), index < slides.count - 1 else {
            return nil
        }
        return slides[index + 1]
    }
    
}


class SlideViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
}




struct ViewControllerProvider7: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SubscribeVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
