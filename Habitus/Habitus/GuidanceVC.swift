//
//  File.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit

class GuideModel {
 
}


class GuideView {
    
    
}


enum ImageShape {
    case square
    case circle
    // Добавьте другие формы, если необходимо
}

class GuidanceVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var imageNames  = [
        ("guidePrew", ImageShape.circle),
        ("guidePrew2", ImageShape.square),
        ("guidePrew3", ImageShape.square),
        ("guidePrew4", ImageShape.square),
        ("guidePrew5", ImageShape.square)
    ]
    
    var texts = [
          """
TrackTide
Поможет вам завести и поддерживать полезные привычки, позволяя достичь долгосрочных целей.
""",
          "Добавьте привычку, выберите цвет и укажите, как часто вы хотите повторять привычку в определенный интервал",
          "Отметьте выполнение привычки в указанный день.Каждое повторение делает вашу привычку сильнее, а каждый пропуск - слабее.",
          "При помощи графиков вы легко можете посмотреть полную историю ваших привычек и то, как они закреплялись со",
          "конец"
      ]
    
 
    var pageControl: UIPageControl!
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let button = ButtonsWithAction.addButtonWithAction(setTitle: "пропустить")
    
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
        
        Layout.applyView(pageControl, view: view,leadingOffset: 10,trailingOffset: -10 , bottomOffset: -60)
    }
    
    func viewControllerAtIndex(_ index: Int) -> ImagePresentViewController? {
        guard index >= 0 && index < imageNames.count else { return nil }
        
        let (imageName, imageShape) = imageNames[index] // Извлечение значений из кортежа
        let description = texts[index]
        let contentVC = ImagePresentViewController()
        contentVC.imageName = imageName
        contentVC.currentIndex = index
        contentVC.totalPages = imageNames.count
        contentVC.imageShape = imageShape // Установка формы изображения
        contentVC.imageDescription = description
        return contentVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentVC = viewController as! ImagePresentViewController
        var index = currentVC.currentIndex
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentVC = viewController as! ImagePresentViewController
        var index = currentVC.currentIndex
        index += 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed, let visibleVC = viewControllers?.first as? ImagePresentViewController {
            pageControl.currentPage = visibleVC.currentIndex
            
//            // Проверяем, достигли ли мы последней страницы
//            if visibleVC.currentIndex == imageNames.count - 1 {
//                //                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                self.dismiss(animated: true, completion: nil)
//                //                            }
//            }
            
        }
    }
}

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
        
        //        view.backgroundColor = .systemBackground
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel = UILabel()
               descriptionLabel.text = imageDescription
               descriptionLabel.textAlignment = .center
               descriptionLabel.numberOfLines = 0
               descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        
        view.addSubview(imageView)
        
        
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
            make.centerY.equalToSuperview().offset(-60) // -50 - guidePrew2
            make.width.equalTo(400)
            make.height.equalTo(500) // 450 - guidePrew2
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
             make.top.equalTo(imageView.snp.bottom).offset(20)
             make.leading.equalTo(view.snp.leading).offset(20)
             make.trailing.equalTo(view.snp.trailing).offset(-20)
             make.bottom.lessThanOrEqualTo(view.snp.bottom).offset(-20)
         })
     }
}
