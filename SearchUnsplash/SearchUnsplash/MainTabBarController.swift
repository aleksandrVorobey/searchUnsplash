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
                
        let photosVC = PhotosCollectionViewControllers(collectionViewLayout: UICollectionViewFlowLayout())
        
        let likesVC = LikesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

        viewControllers = [generateNavController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "photo")!),
                           generateNavController(rootViewController: likesVC, title: "Favourites", image: UIImage(systemName: "heart.fill")!)]
    }
    
    private func generateNavController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
