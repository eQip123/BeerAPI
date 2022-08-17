//
//  RandomPresenter.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 10/8/22.
//

import Foundation

protocol RandomViewPresenter: AnyObject {
    init(view: RandomView)
    func getRandomBeer()
}
class RandomPresenter: RandomViewPresenter {
      var view: RandomView?
    
    required init(view: RandomView) {
        self.view = view
    }
    
    func getRandomBeer() {
        NetworkApi.shared.getRandomBeerAPI { beer in
            self.view?.getRandomBeer(beer: beer)
        }
    }
    
    
}
