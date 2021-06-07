//
//  DiffableDataSourceViewController.swift
//  MainApp
//
//  Created by Rex Chen on 2021/6/7.
//

import UIKit

struct Contact {
    var title: String
    var description: String
    var iconUrl: String
}
enum Section {
    case movie
}
struct Movie: Hashable {
    var name: String
    var actor: String
    var year: Int
    var icon: String
}

let movies = [
    Movie(name: "蜘蛛人:返校日", actor: "湯姆", year: 2017, icon: "Twitter"),
    Movie(name: "蜘蛛人:驚奇再起", actor: "安德魯", year: 2012, icon: "Youtube"),
    Movie(name: "蜘蛛人", actor: "陶比", year: 2002, icon: "Snapchat")
]

class DiffableDataSourceViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: self.view.bounds.size.width / 2, height: 160)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.register(DiffableCollectionViewCell.self,
                                forCellWithReuseIdentifier: DiffableCollectionViewCell.identifier)
        // DataSource
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(
            collectionView: collectionView, cellProvider: { (collectionView, indexPath, movie)
                -> UICollectionViewCell? in
                let cell =
                    collectionView.dequeueReusableCell(withReuseIdentifier: DiffableCollectionViewCell.identifier,
                                                              for: indexPath) as? DiffableCollectionViewCell
                if let cell = cell {
                    cell.title.text = movie.actor
                    let insetValue: CGFloat = -18
                    var image: UIImage = UIImage.init(named: movie.icon)!
                    image = image.withAlignmentRectInsets(UIEdgeInsets(top: insetValue,
                                                                       left: insetValue,
                                                                       bottom: insetValue,
                                                                       right: insetValue))
                    cell.imageView.image = image
                    return cell
                }
                return collectionView.dequeueReusableCell(withReuseIdentifier: DiffableCollectionViewCell.identifier,
                                                          for: indexPath)
            }
        )
        collectionView.dataSource = dataSource

        var snapShot = NSDiffableDataSourceSnapshot<Section, Movie>()

        snapShot.appendSections([.movie])

        snapShot.appendItems(movies)

        dataSource.apply(snapShot, animatingDifferences: false)
    }
}
