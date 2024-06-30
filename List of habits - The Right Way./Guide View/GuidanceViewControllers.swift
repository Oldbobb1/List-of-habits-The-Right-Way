//  GuidanceViewControllers.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

//class GuidanceViewControllers: UIViewController {
//    
//    var swipe: SwipeClass?
//    var guide: GuideModel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        guide = GuideModel()
//        guide.updateUI(view: self.view)
//        swipeActions()
//    }
//    
//    private func swipeActions() {
//        swipe = SwipeClass(viewController: self,
//                           leftAction: { [weak self] in
//            guard let self = self else {return}
//            let view = FirstViewController()
//            self.navigationController?.pushViewController(view, animated: true)
//        },
//                           rightAction: { [weak self] in
//            guard let self = self else {return}
//            self.dismiss(animated: true, completion: nil)
//        })
//    }
//}




    


class GuidanceViewControllers: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let imageNames = ["guidePrew", "guidePrew", "LaunchImage", "guidePrew", "LaunchImage"]
    var pageControl: UIPageControl!
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let button = ButtonsWithAction.addButtonWithAction(setTitle: "пропустить", height: 40, width: 60)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstVC = viewControllerAtIndex(0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.titleLabel?.textColor = .blue
        Layout.applyView(button, view: view, leadingOffset: 130, trailingOffset: -130, bottomOffset: -20)
        button.addTarget(self, action: #selector(tapp), for: .touchUpInside )
        
        configurePageControl()
    }
    @objc func tapp() {
        self.dismiss(animated: true, completion: nil)

    }
    
    private func configurePageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = imageNames.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        view.addSubview(pageControl)
        
        
//        NSLayoutConstraint.activate([
//            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
        
        Layout.applyView(pageControl, view: view,leadingOffset: 10,trailingOffset: -10 , bottomOffset: -60)
    }
  
    func viewControllerAtIndex(_ index: Int) -> ImageContentViewController? {
        guard index >= 0 && index < imageNames.count else { return nil }
        
        let contentVC = ImageContentViewController()
        contentVC.imageName = imageNames[index]
        contentVC.currentIndex = index
        contentVC.totalPages = imageNames.count
        
        return contentVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentVC = viewController as! ImageContentViewController
        var index = currentVC.currentIndex
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentVC = viewController as! ImageContentViewController
        var index = currentVC.currentIndex
        index += 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleVC = viewControllers?.first as? ImageContentViewController {
            pageControl.currentPage = visibleVC.currentIndex
        }
    }
}

class ImageContentViewController: UIViewController {
    
    var imageView: UIImageView!
    var imageName: String?
    var currentIndex = 0
    var totalPages = 0
    
    var swipe: SwipeClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //        imageView.layer.cornerRadius = 150
        
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
   
    }
  
}


