//
//  BeerListPresenter.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 5/8/22.
//

import Foundation

protocol BeerListViewPresenter: AnyObject {
    init(view: BeerListView)
    func viewDidLoad()
}
class BeerListPresenter: BeerListViewPresenter {
    private weak var view: BeerListView?
    private var beers: [Beer] = []
    let network = NetworkApi.shared
    
    required init(view: BeerListView) {
        self.view = view
    }

    func viewDidLoad() {
        network.getBeerList { beerList in
            self.view?.getBeerList(beers: beerList)
        }
    }
    
    
    
    
}
