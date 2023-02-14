//
//  SearchPresenter.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 10/8/22.
//

import Foundation

protocol SearchViewPresenter: AnyObject {
    init(view: SearchView)
    func getSearchBeerPresenter(id: Int)
}

class SearchPresenter: SearchViewPresenter {
      private weak var view: SearchView?
    
    required init(view: SearchView) {
        self.view = view
    }
    
    func getSearchBeerPresenter(id: Int) {
        NetworkApi.shared.getSearchId(id: id) { beer in
            switch beer {
            case .success(let success):
                self.view?.getSearchId(beer: success)
            case .failure(let failure):
                print(failure)
                self.view?.showError(message: "not found")
            }
        }
    }

    
}
