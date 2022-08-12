//
//  BeerTableViewCell.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 5/8/22.
//

import Foundation
import UIKit
//MARK: - Custom Cell for TableView
class BeerTableViewCell: UITableViewCell {
    private lazy var titleView: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    private lazy var myImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
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
        titleView.frame = CGRect(x: 0, y:0, width: 300, height: 60)
        titleView.center = center
    }
    override func prepareForReuse() {
         super.prepareForReuse()
        print("prepare")
    }
    func setupView(model: Beer) {
        DispatchQueue.main.async {
            self.titleView.text = model.name
        }
    }
    
    
}
