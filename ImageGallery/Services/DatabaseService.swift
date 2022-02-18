//
//  DatabaseController.swift
//  ImageGallery
//
//  Created by Олег Федоров on 17.02.2022.
//

import Foundation
import CoreData

class DatabaseService {

    static let shared = DatabaseService()
    private init() {}

    static var persistentContainer: NSPersistentContainer = {
        //The container that holds both data model entities
        let container = NSPersistentContainer(name: "ImageGallery")

        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    //Returns the current Persistent Container for CoreData
    class func getContext () -> NSManagedObjectContext {
        return DatabaseService.persistentContainer.viewContext
    }

    // MARK: - Core Data Saving support
    class func saveContext() {
        let context = self.getContext()
        if context.hasChanges {
            do {
                try context.save()
                print("Data Saved to Context")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // GET / Fetch / Requests
    func getAllShows() -> Array<PhotoModel> {
        let all = NSFetchRequest<PhotoModel>(entityName: "PhotoModel")
        var allPhotos = [PhotoModel]()

        do {
            let fetched = try DatabaseService.getContext().fetch(all)
            allPhotos = fetched
        } catch {
            let nserror = error as NSError
            print(nserror.description)
        }

        return allPhotos
    }
}
