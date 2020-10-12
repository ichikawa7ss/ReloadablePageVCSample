//
//  ChildViewController.swift
//  ReloadablePageViewControllerSample
//
//  Created by ichikawa on 2020/10/12.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

final class ChildCollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var data = [Int](1...100)
}

extension ChildCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! ChildCollectionViewCell
        cell.setData("No. \(String(self.data[indexPath.row]))")
        return cell
    }
}
