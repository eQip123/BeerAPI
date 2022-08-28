//
//  BeerTableViewCell.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 5/8/22.
//

import Foundation
import UIKit
import Kingfisher
//MARK: - Custom Cell for TableView
class BeerTableViewCell: UITableViewCell {
    private lazy var titleView: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 17, weight: .bold)
        return view
    }()
    private lazy var myImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubview() {
        addSubview(titleView)
        addSubview(myImageView)
        myImageView.frame = CGRect(x: 0, y: 20, width: 100, height: 100)
        titleView.frame = CGRect(x: 100, y: 50, width: 300, height: 30)
    }
    override func prepareForReuse() {
         super.prepareForReuse()
        print("prepare")
    }
    func setupView(model: Beer) {
        DispatchQueue.main.async {
            self.titleView.text = model.name
            self.myImageView.kf.setImage(with: URL(string: model.imageURL ?? ""))
        }
    }
    
    
}
