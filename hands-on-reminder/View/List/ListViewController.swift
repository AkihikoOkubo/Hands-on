//
//  ListViewController.swift
//  hands-on-reminder
//
//  Created by Akihiko Okubo on 2018/12/17.
//  Copyright © 2018年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    
    @IBOutlet weak var reminderText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let rs = UserDefaultsUtil.reminders {
            var text = ""
            rs.reminders.forEach{
                text = text + "name:\($0.name) text:\($0.text) timestamp:\($0.timestamp) \n"
            }
            reminderText.text = text
        }
        
    }
    
    
    @IBAction func add(_ sender: Any) {
        let vc = SaveViewController.make()
        present(vc, animated: true)
    }
    
}
