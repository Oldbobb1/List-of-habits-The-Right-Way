//  GuidanceVC.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class GuidanceVC: UIPageViewController {
    
    let guideVIew = GuideViewUI()

    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    
        configureUI()
    }
    
    func configureUI(){
        guideVIew.initializeUI(view)
        guideVIew.skipButtonPress.addTarget(self, action: #selector(buttonTappClose), for: .touchUpInside )
        
        if let firstVC = viewControllerAtIndex(0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    @objc func buttonTappClose() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewControllerAtIndex(_ index: Int) -> ImagePresentViewController? {
        guard index >= 0 && index < guideVIew.imageNames.count else { return nil }
        
        let (imageName, imageShape) = guideVIew.imageNames[index] // Извлечение значений из кортежа
        let description = guideVIew.texts[index]
        let contentVC = ImagePresentViewController()
        contentVC.imageName = imageName
        contentVC.currentIndex = index
        contentVC.totalPages = guideVIew.imageNames.count
        contentVC.imageShape = imageShape // Установка формы изображения
        contentVC.imageDescription = description
        return contentVC
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed, let visibleVC = viewControllers?.first as? ImagePresentViewController {
            guideVIew.pageControl.currentPage = visibleVC.currentIndex
            
//            // Проверяем, достигли ли мы последней страницы
//            if visibleVC.currentIndex == imageNames.count - 1 {
//                //                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                self.dismiss(animated: true, completion: nil)
//                //                            }
//            }
        }
    }
}
