//
//  ChildCollectionViewCell.swift
//  ReloadablePageViewControllerSample
//
//  Created by ichikawa on 2020/10/12.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

final class ChildCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ text: String) {
        self.label.text = text
    }
}
