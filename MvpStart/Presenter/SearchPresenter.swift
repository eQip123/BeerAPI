//
//  SearchPresenter.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 10/8/22.
//

import Foundation
import SwiftUI
protocol SearchViewPresenter: AnyObject {
    init(view: SearchView)
    func getSearchBeerPresenter(id: Int)
}

class SearchPresenter: SearchViewPresenter {
    var view: SearchView?
    
    required init(view: SearchView) {
        self.view = view
    }
    func getSearchBeerPresenter(id: Int) {
//        NetworkApi.shared.getSearchId(id: id) { beer in
//            self.view?.getSearchBeer(beer: beer)
        }
    }

