//
//  PhotoModel+CoreDataProperties.swift
//  ImageGallery
//
//  Created by Олег Федоров on 17.02.2022.
//
//

import Foundation
import CoreData


extension PhotoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoModel> {
        return NSFetchRequest<PhotoModel>(entityName: "PhotoModel")
    }

    @NSManaged public var albumID: Int16
    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var thumbnailURL: String?
    @NSManaged public var uuid: String?

}

extension PhotoModel : Identifiable {

}
