//
//  image.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 9.06.24.
//

import UIKit


public class Image {
    
    public  static  func createImage (_ named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named:named)
        imageView.clipsToBounds = true
        return imageView
    }
}

