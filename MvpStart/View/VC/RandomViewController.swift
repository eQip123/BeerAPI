//
//  RandomVC.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 10/8/22.
//

import Foundation
import UIKit
import Kingfisher

protocol RandomView: AnyObject {
    func getRandomBeer(beer: [Beer])
}
class RandomViewController: UIViewController {
      var presenter: RandomViewPresenter?
    private lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: ""))
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
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Roll Random", for: .normal)
        button.addTarget(self, action: #selector(pressRandom), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Random Beer"
    }
    private func setupConstraints() {
        view.addSubview(image)
        view.addSubview(nameLabel)
        view.addSubview(bodyLabel)
        view.addSubview(button)
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
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
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
    }
   private func setupView() {
        view.backgroundColor = .white
    }
    
    @objc func pressRandom() {
        presenter?.getRandomBeer()
    }
    
}
extension RandomViewController: RandomView {
    func getRandomBeer(beer: [Beer]) {
        nameLabel.text = beer[0].name
        bodyLabel.text = beer[0].description
        image.kf.setImage(with: URL(string: beer[0].imageURL ?? ""))
    }

}
