//
//  RepositoryManagedObject+CoreDataProperties.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//
//

import Foundation
import CoreData


extension RepositoryManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepositoryManagedObject> {
        return NSFetchRequest<RepositoryManagedObject>(entityName: "RepositoryManagedObject")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var fullName: String
    @NSManaged public var repoDescription: String?
    @NSManaged public var forksCount: Int32
    @NSManaged public var createdDate: NSDate
    @NSManaged public var updatedDate: NSDate
    @NSManaged public var language: String?
    @NSManaged public var license: LicenseManagedObject?

}

extension RepositoryManagedObject: ManagedObjectProtocol {
    typealias Entity = Repository
    
    func toEntity() -> Repository? {
        return Repository(
            id: Int(id),
            name: name,
            fullName: fullName,
            description: repoDescription,
            license: license?.toEntity(),
            created: createdDate as Date,
            updated: updatedDate as Date,
            language: language
        )
    }
}

extension Repository: ManagedObjectConvertible {
    typealias ManagedObject = RepositoryManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> RepositoryManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "RepositoryManagedObject", in: context) else {
            return nil
        }
        let repository = RepositoryManagedObject(entity: entity, insertInto: context)
        repository.id = Int64(self.id)
        repository.name = self.name
        repository.fullName = self.fullName
        repository.repoDescription = self.description
        repository.forksCount = Int32(self.forksCount)
        repository.createdDate = self.created as NSDate
        repository.updatedDate = self.updated as NSDate
        repository.language = self.language
        repository.license = self.license?.toManagedObject(in: context)
        
        return repository
    }
}
