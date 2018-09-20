//
//  UIStoryboard+Loader.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import UIKit

fileprivate extension UIStoryboard {
    
    static func load(identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
}

extension UIStoryboard {
    
    
    class func loadDetail() -> DetailVC {
        return load(identifier: "DetailVC") as! DetailVC
    }
    
    
}
