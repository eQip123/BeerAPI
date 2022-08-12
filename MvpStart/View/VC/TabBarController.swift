//
//  TabBarController.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 5/8/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configureTabBarItems()
        
    }
    private func configureTabBarItems() {
        let listVC = BeerListViewController()
        let listPresenter = BeerListPresenter(view: listVC)
        listVC.presenter = listPresenter
        listVC.tabBarItem = UITabBarItem(title: "Lists", image: UIImage(systemName: "1.circle"), tag: 0)
        
        let randomVC = RandomViewController()
        let randomPresenter = RandomPresenter(view: randomVC)
        randomVC.presenter = randomPresenter
        randomVC.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "2.circle"), tag: 1)
        
        let searchVC = SearchViewController()
        let searchPresenter = SearchPresenter(view: searchVC)
        searchVC.presenter = searchPresenter
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "3.circle"), tag: 2)
        
        let listNavigationVC = UINavigationController(rootViewController: listVC)
        let randomNavigationVC = UINavigationController(rootViewController: randomVC)
        let searchNavigationVC = UINavigationController(rootViewController: searchVC)
        
        //Панели вкладок TabBar, добавили их в массив
        setViewControllers([listNavigationVC, randomNavigationVC, searchNavigationVC], animated: true)
    }
    
    

}
