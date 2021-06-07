import UIKit

enum OutlineItem: Hashable {
    case parent(Parent)
    case child(Child)
}
struct Child: Hashable {
    let item: String
}
struct Parent: Hashable {
    let item: String
    let childItems: [Child]
}

class DiffableIOS14CollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    private lazy var dataSource = makeDataSource()
    let hirerachicalData = [
        Parent(item: "First", childItems: Array(0...4).map { Child(item: String($0)) }),
        Parent(item: "Second", childItems: Array(5...10).map { Child(item: String($0)) }),
        Parent(item: "Third", childItems: Array(11...13).map { Child(item: String($0)) })
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.dataSource = dataSource

        var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<OutlineItem>()
        for data in hirerachicalData {
            let header = OutlineItem.parent(data)
            sectionSnapshot.append([header])
            sectionSnapshot.append(data.childItems.map { OutlineItem.child($0) }, to: header)
            sectionSnapshot.expand([header])
        }
        dataSource.apply(sectionSnapshot, to: "Root", animatingDifferences: false, completion: nil)
    }
    func makeDataSource() -> UICollectionViewDiffableDataSource<String, OutlineItem> {
        let parentRegistration =
            UICollectionView.CellRegistration<UICollectionViewListCell, Parent> { cell, _, item in
                var content = cell.defaultContentConfiguration()
                content.text = item.item
                cell.contentConfiguration = content
                let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
                cell.accessories = [.outlineDisclosure(options:headerDisclosureOption)]
            }
        let cellRegistration =
            UICollectionView.CellRegistration<UICollectionViewListCell, Child> { cell, _, item in
                var content = cell.defaultContentConfiguration()
                content.text = item.item
                cell.indentationLevel = 0
                cell.contentConfiguration = content
            }
        return UICollectionViewDiffableDataSource<String, OutlineItem>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, item in
                switch item {
                case .parent(let parentItem):
                    let cell = collectionView.dequeueConfiguredReusableCell(
                        using: parentRegistration,
                        for: indexPath,
                        item: parentItem)
                    return cell
                case .child(let childItem):
                    let cell = collectionView.dequeueConfiguredReusableCell(
                        using: cellRegistration,
                        for: indexPath,
                        item: childItem)
                    return cell
                }
            })
    }
}
