//
//  PhotoModel+CoreDataClass.swift
//  ImageGallery
//
//  Created by Олег Федоров on 17.02.2022.
//
//

import Foundation
import CoreData

@objc(PhotoModel)
public class PhotoModel: NSManagedObject {
    convenience init() {
        self.init(
            entity: DatabaseService.shared.entityForName(entityName: "PhotoModel"),
            insertInto: DatabaseService.shared.context
        )
    }
}
