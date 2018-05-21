//
//  LicenseManagedObject+CoreDataProperties.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//
//

import Foundation
import CoreData


extension LicenseManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LicenseManagedObject> {
        return NSFetchRequest<LicenseManagedObject>(entityName: "LicenseManagedObject")
    }

    @NSManaged public var key: String
    @NSManaged public var name: String
    @NSManaged public var url: String?
    @NSManaged public var spdxId: String?
    @NSManaged public var repository: NSSet?

}

// MARK: Generated accessors for repository
extension LicenseManagedObject {

    @objc(addRepositoryObject:)
    @NSManaged public func addToRepository(_ value: RepositoryManagedObject)

    @objc(removeRepositoryObject:)
    @NSManaged public func removeFromRepository(_ value: RepositoryManagedObject)

    @objc(addRepository:)
    @NSManaged public func addToRepository(_ values: NSSet)

    @objc(removeRepository:)
    @NSManaged public func removeFromRepository(_ values: NSSet)

}

extension LicenseManagedObject: ManagedObjectProtocol {
    typealias Entity = License
    
    func toEntity() -> License? {
        return License(key: key, name: name, spdxId: spdxId, url: url)
    }
}

extension License: ManagedObjectConvertible {
    typealias ManagedObject = LicenseManagedObject
    
    func toManagedObject(in context: NSManagedObjectContext) -> LicenseManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: "LicenseManagedObject", in: context) else {
            return nil
        }
        let license = LicenseManagedObject(entity: entity, insertInto: context)
        license.key = self.key
        license.name = self.name
        license.spdxId = self.spdxId
        license.url = self.url //TODO repositories
        
        return license
    }
}
