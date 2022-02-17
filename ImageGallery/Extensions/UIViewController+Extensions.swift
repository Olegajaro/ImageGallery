//
//  UIViewController+Extensions.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import UIKit

extension UIViewController {
    func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .darkGray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        
        return activityIndicator
    }
}
