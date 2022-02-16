//
//  GalleryCell.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation
import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let identifier = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .lightGray
//        contentView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
