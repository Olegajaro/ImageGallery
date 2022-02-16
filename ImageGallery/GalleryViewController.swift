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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Gallery"
        collectionView.register(GalleryCell.self,
                                forCellWithReuseIdentifier: GalleryCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }

    private func fetchData() {
        networkService.fetchCat { result in
            switch result {
            case .success(let photos):
                self.photos = photos
                print(photos.first?.title ?? "nil")
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
        
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegate {}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width + 40)
    }
}
