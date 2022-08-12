//
//  SearchVC.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 10/8/22.
//

import Foundation
import UIKit
import SwiftUI

protocol SearchView: AnyObject {
    func getSearchBeer(beer: [Beer])
}

class SearchViewController: UIViewController {
    weak var presenter: SearchViewPresenter?
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textAlignment = .left
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        textField.backgroundColor = .systemFill
        textField.returnKeyType = .go
        return textField
    }()
    private lazy var buttonSearch: UIButton = {
        let buttton = UIButton(type: .system)
        buttton.addTarget(self, action: #selector(searchButtonPresed), for: .touchUpInside)
        buttton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        buttton.contentMode = .scaleAspectFill
        buttton.tintColor = .black
        return buttton
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart"))
        imageView.sizeToFit()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchTextField.delegate = self
        setupConstraints()
    }
    private func setupConstraints() {
        view.addSubview(searchTextField)
        view.addSubview(buttonSearch)
        view.addSubview(image)
        view.addSubview(nameLabel)
        view.addSubview(bodyLabel)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(40)
        }
        buttonSearch.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(searchTextField.snp.trailing).inset(-70)
            make.height.width.equalTo(40)
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(40)
            make.height.width.equalTo(UIScreen.main.bounds.height / 4)
            make.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            
        }
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    @objc func searchButtonPresed() {
        if let searchId = searchTextField.text {
            NetworkApi.shared.getSearchId(id: Int(searchId)!) { beer in
                self.getSearchBeer(beer: beer)
            }
        }
//        if let searchId = searchTextField.text {
//            presenter?.getSearchBeerPresenter(id: Int(searchId)!)
//        }

    }
    
}
extension SearchViewController: SearchView {
    func getSearchBeer(beer: [Beer]) {
        nameLabel.text = beer[0].name
        bodyLabel.text = beer[0].description
        image.kf.setImage(with: URL(string: beer[0].imageURL ?? ""))
    }
}
extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true) // Убирает клавиатуру, после нажатия кнопки в клаве
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Введите что-нибудь"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let searchId = searchTextField.text {
//            presenter?.getSearchBeerPresenter(id: Int(searchId)!)
//        }
        searchTextField.text = ""
        
    }
}

