//
//  ElementDTO.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class ElementDTO : Mappable {
    var serviceId: Int?
    var serviceName: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        serviceId <- map["ServiceID"]
        serviceName <- map["ServiceName"]
    }
    
    func fill(managedObject: NSManagedObject) {
        managedObject.setValue(self.serviceId, forKey: "serviceID")
        managedObject.setValue(self.serviceName, forKey: "serviceName")
    }
}
