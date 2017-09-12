//
//  DataShow.swift
//  DemoApp
//
//  Created by appinventiv on 12/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class DataShow: UIViewController {
    // variables declaration
    var name: Any!
    var country: Any!
    var state: Any!
    var city: Any!
    var phoneno: Any!
    var username: Any!
    var emailid: Any!
    var password: Any!
    

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var phonenoLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var emailidLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name as? String
        countryLabel.text = country as? String
        stateLabel.text = state as? String
        cityLabel.text = city as? String
        phonenoLabel.text = phoneno as? String
        usernameLabel.text = username as? String
        emailidLabel.text = emailid as? String
        passwordLabel.text = password as? String
        
        
    }


}
