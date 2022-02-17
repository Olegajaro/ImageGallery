//
//  GalleryCell.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation
import UIKit
import SDWebImage

class GalleryCell: UICollectionViewCell {
    
    static let identifier = "cellID"
    
    var photo: PhotoModelCodable!
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    func configure(withPhoto photo: PhotoModelCodable) {
        if let url = URL(string: photo.thumbnailURL) {
            photoImage.sd_setImage(with: url)
        }
        informationLabel.text = "Image id: \(photo.id), Size: 150x150"
    }

    private func setupViews() {
        contentView.backgroundColor = UIColor(named: "CellColor")
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photoImage)
        
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(informationLabel)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(
                equalTo: photoImage.bottomAnchor, constant: 8
            ),
            informationLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 8
            ),
            informationLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -8
            )
        ])
        
    }
}
