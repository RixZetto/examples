//
//  UINib+Loader.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import UIKit

fileprivate extension UINib {
    static func nib(named nibName: String) -> UIView {
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}

extension UINib {

    class func loadEmptyView() -> UIView {
        return nib(named: "EmptyView")
    }
}
