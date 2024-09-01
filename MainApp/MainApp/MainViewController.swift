import UIKit

class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .darkGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCollectionViewCell.self,
                                forCellWithReuseIdentifier: MainCollectionViewCell.reuseIdentifier)
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseIdentifier,
                                                      for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.size.width, height: 400)
    }
}
