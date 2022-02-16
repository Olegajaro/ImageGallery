//
//  PhotoDetailController.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation
import UIKit

class PhotoDetailController: UIViewController {
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var photo: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoImageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor)
        ])
    }
    
    func configure(withPhoto photo: Photo) {
        photoImageView.sd_setImage(with: photo.url)
    }
}
