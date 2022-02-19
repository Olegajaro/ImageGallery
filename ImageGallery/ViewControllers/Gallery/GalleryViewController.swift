//
//  GalleryViewController.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import UIKit
import CoreData

class GalleryViewController: UIViewController {
    
    // MARK: - UIElements
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private var activityIndicator: UIActivityIndicatorView?
    
    // Instance of NetworkService Class
    let networkService = NetworkService.shared
    // CoreData Entity
    var photos: [PhotoModel]?
    // Codeable Model for object
    var newPhotos: [PhotoModelCodeable]? {
        didSet {
            // Add the new spots to Core Data Context
            guard let newPhotos = newPhotos else { return }
            addNewPhotosToCoreData(newPhotos)
            // Save them to Core Data
            DatabaseService.shared.saveContext()
            // Reload the collecionView
            collectionView.reloadData()
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photos = DatabaseService.shared.getAllShows()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - Setup CollectionView
    private func setup() {
        view.backgroundColor = UIColor(named: "AppBackgroundColor")
        navigationItem.title = "Gallery"
        
        collectionView.register(
            GalleryCell.self,
            forCellWithReuseIdentifier: GalleryCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }

    // MARK: - Private Methods
    private func fetchData() {
        
        if DatabaseService.shared.getAllShows().count == 0 {
            activityIndicator = showActivityIndicator(in: view)
            
            networkService.fetchPhotos { [weak self] result in
                switch result {
                case .success(let photos):
                    self?.newPhotos = photos
                    self?.activityIndicator?.stopAnimating()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            return
        }
    }
    
    private func addNewPhotosToCoreData(_ photos: [PhotoModelCodeable]) {

        for photo in photos {
            let newPhoto = PhotoModel()

            // Create a unique ID for the Photo.
            let uuid = UUID()
            newPhoto.id = photo.id
            newPhoto.albumID = photo.albumID
            newPhoto.title = photo.title
            newPhoto.url = photo.url
            newPhoto.thumbnailURL = photo.thumbnailURL
            newPhoto.uuid = uuid.uuidString
        }
    }
}
 
// MARK: - UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        DatabaseService.shared.getAllShows().count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCell.identifier,
            for: indexPath
        ) as! GalleryCell
        
        photos = DatabaseService.shared.getAllShows()
        
        guard let photo = photos?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        if photos?.count != 0 {
            cell.configure(withPhoto: photo)
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
       
        let photo = photos?[indexPath.row]
        
        let controller = PhotoDetailController()
        controller.configure(withPhoto: photo)
        
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        2
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        2
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (view.frame.width - 4) / 3
        return CGSize(width: width, height: width + 20)
    }
}
