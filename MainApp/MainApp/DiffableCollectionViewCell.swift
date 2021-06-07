//
//  DiffableCollectionViewCell.swift
//  MainApp
//
//  Created by Rex Chen on 2021/6/7.
//

import UIKit

class DiffableCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "DiffableCollectionViewCell"
    var title: UILabel!
    var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        title = UILabel.init(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            title.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        imageView = UIImageView.init(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        imageView.contentMode = .scaleAspectFit

        self.backgroundColor = .cyan
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
