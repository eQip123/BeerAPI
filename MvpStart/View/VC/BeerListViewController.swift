//
//  BeerListVC.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 5/8/22.
//

import Foundation
import UIKit
import SnapKit

protocol BeerListView: AnyObject {
    func getBeerList(beers: [Beer])
}
class BeerListViewController: UIViewController {
    var presenter: BeerListViewPresenter!
    
    private var beers: [Beer] = []
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(BeerTableViewCell.self, forCellReuseIdentifier: "BeerCell")
        return view
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupSubview()
    }
    
    private func setupSubview() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }
    }
}
extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell") as! BeerTableViewCell
        cell.setupView(model: beers[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
extension BeerListViewController: BeerListView {
    func getBeerList(beers: [Beer]) {
        self.beers = beers
        tableView.reloadData()
    }
}

