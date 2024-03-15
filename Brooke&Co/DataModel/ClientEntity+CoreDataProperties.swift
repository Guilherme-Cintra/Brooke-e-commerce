//
//  ClientEntity+CoreDataProperties.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-05.
//
//

import Foundation
import CoreData


extension ClientEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClientEntity> {
        return NSFetchRequest<ClientEntity>(entityName: "ClientEntity")
    }

    @NSManaged public var courriel: String
    @NSManaged public var id: Int
    @NSManaged public var nom: String
    @NSManaged public var password: String
    @NSManaged public var prenom: String
    @NSManaged public var panier: NSSet

}

// MARK: Generated accessors for panier
extension ClientEntity {

    @objc(addPanierObject:)
    @NSManaged public func addToPanier(_ value: ProduitEntity)

    @objc(removePanierObject:)
    @NSManaged public func removeFromPanier(_ value: ProduitEntity)

    @objc(addPanier:)
    @NSManaged public func addToPanier(_ values: NSSet)

    @objc(removePanier:)
    @NSManaged public func removeFromPanier(_ values: NSSet)

}

extension ClientEntity : Identifiable {

}
