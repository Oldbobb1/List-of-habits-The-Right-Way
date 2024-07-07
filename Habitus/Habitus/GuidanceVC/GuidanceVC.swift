//
//  File.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit

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

