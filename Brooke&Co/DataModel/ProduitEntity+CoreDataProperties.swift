//
//  ProduitEntity+CoreDataProperties.swift
//  Brooke&Co
//
//  Created by Charlie Leduc on 2023-12-05.
//
//

import Foundation
import CoreData


extension ProduitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProduitEntity> {
        return NSFetchRequest<ProduitEntity>(entityName: "ProduitEntity")
    }

    @NSManaged public var id: Int
    @NSManaged public var titre: String
    @NSManaged public var prix: Double
    @NSManaged public var descrip: String
    @NSManaged public var image: String
    @NSManaged public var qteStock: Int
    @NSManaged public var qteMin: Int
    @NSManaged public var proprio: ClientEntity?

}

extension ProduitEntity : Identifiable {

}
