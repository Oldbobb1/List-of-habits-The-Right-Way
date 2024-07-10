//  GuidanceVCExtension.swift

//  Habitus

//  Created by Bobbi R. on 10.07.24.

import UIKit

extension GuidanceVC: UIPageViewControllerDataSource{

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
    
}

extension GuidanceVC: UIPageViewControllerDelegate{}
