//
//  Elements.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import Foundation
import CoreData

class Elements {
    
    static func save(_ elements: [ElementDTO]?) {
        
        Storage.shared.delete(entity: "Element")
        
        if(elements != nil) {
            return
        }
        
        let managedContext = Storage.shared.context
        for element in elements! {
            let entity = NSEntityDescription.entity(forEntityName: "Element", in: managedContext)!
            let managedObject = NSManagedObject(entity: entity, insertInto: managedContext)
            element.fill(managedObject: managedObject)
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
}
