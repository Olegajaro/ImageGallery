//
//  PhotoDetailController.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation
import UIKit

class PhotoDetailController: UIViewController {
    
    // MARK: - UIElements
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    // MARK: -  View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layout()
    }
    
    // MARK: - Configure
    func configure(withPhoto photo: PhotoModel?) {
        if let url = URL(string: photo?.url ?? "") {
            photoImageView.sd_setImage(
                with: url,
                placeholderImage: UIImage(systemName: "wifi.exclamationmark")
            )
        }
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        view.backgroundColor = UIColor(named: "AppBackgroundColor")
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoImageView)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Date of download: \(Date().dateFormatString)"
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textAlignment = .center
        view.addSubview(dateLabel)
    }
    
    // MARK: - Layout
    private func layout() {
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            photoImageView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            photoImageView.widthAnchor.constraint(
                equalToConstant: view.frame.size.width
            ),
            photoImageView.heightAnchor.constraint(
                equalTo: photoImageView.widthAnchor
            )
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(
                equalTo: photoImageView.bottomAnchor, constant: 16
            ),
            dateLabel.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor
            ),
            dateLabel.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor
            )
        ])
    }
}
