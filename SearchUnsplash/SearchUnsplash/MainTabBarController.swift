//
//  MainTabBarController.swift
//  SearchUnsplash
//
//  Created by Александр Воробей on 01.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        let photosVC = PhotosCollectionViewControllers(collectionViewLayout: UICollectionViewFlowLayout())
        viewControllers = [photosVC, ViewController()]
    }
}
