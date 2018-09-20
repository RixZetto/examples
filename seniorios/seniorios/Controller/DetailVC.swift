//
//  DetailVC.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    var element: ElementDTO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = String(element!.serviceId!)
        descLabel.text = element!.serviceName
    }
    
}
