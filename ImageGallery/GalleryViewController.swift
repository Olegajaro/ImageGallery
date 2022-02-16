//
//  GalleryViewController.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import UIKit

class GalleryViewController: UIViewController {
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private var activityIndicator: UIActivityIndicatorView?
    
    let networkService = NetworkService()
    
    var photos: [Photo] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        fetchData()
        activityIndicator = showActivityIndicator(in: view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(named: "AppBackgroundColor")
        navigationItem.title = "Gallery"
        
        collectionView.register(GalleryCell.self,
                                forCellWithReuseIdentifier: GalleryCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }

    private func fetchData() {
        networkService.fetchPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
                self?.activityIndicator?.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
 
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCell.identifier,
            for: indexPath
        ) as! GalleryCell
        
        cell.configure(withPhoto: photos[indexPath.row])
        
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let controller = PhotoDetailController()
        controller.configure(withPhoto: photos[indexPath.row])
        
        navigationController?.pushViewController(controller, animated: true)
    }
}

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
        return CGSize(width: width, height: width + 40)
    }
}
