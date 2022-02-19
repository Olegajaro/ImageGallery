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

    lazy var persistentContainer: NSPersistentContainer = {
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
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()

    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)!
    }

    // MARK: - Core Data Saving support
    func saveContext() {
        let context = persistentContainer.viewContext
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
        let fetchRequest = NSFetchRequest<PhotoModel>(entityName: "PhotoModel")
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let context = persistentContainer.viewContext
        var allPhotos = [PhotoModel]()

        do {
            let results = try context.fetch(fetchRequest)
            allPhotos = results
        } catch {
            let nserror = error as NSError
            print(nserror.description)
        }

        return allPhotos
    }
}
