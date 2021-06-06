//
//  MainViewController.swift
//  MainApp
//
//  Created by Rex Chen on 2021/6/5.
//

import UIKit
import Combine

class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {

    @Published var canSendMessage: Bool = false
    private var sendSubscriber: AnyCancellable!
    var sendButton: UIButton!
    var switchToggle: UISwitch!
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

        sendButton = UIButton.init(frame: CGRect(x: 10, y: 10, width: 100, height: 60))
        sendButton.layer.borderWidth = 1
        sendButton.setTitle("SEND", for: .normal)
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.setTitleColor(.lightGray, for: .disabled)
        sendButton.backgroundColor = .white
        self.view.addSubview(sendButton)

        sendSubscriber = $canSendMessage.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: sendButton)

        switchToggle = UISwitch.init(frame:
                                        CGRect(origin: CGPoint.init(x: 100, y: 100),
                                               size: CGSize(width: 100, height: 60)))
        self.view.addSubview(switchToggle)
        switchToggle.addTarget(self, action: #selector(onToggle(sender:)), for: .valueChanged)
    }
    @objc
    func onToggle(sender: UISwitch) {
        print(sender)
        canSendMessage = sender.isOn
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
