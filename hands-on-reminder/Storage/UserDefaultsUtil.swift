//
//  UserDefaultsUtil.swift
//  hands-on-reminder
//
//  Created by Akihiko Okubo on 2018/12/17.
//  Copyright © 2018年 akihiko.com. All rights reserved.
//

import Foundation

class UserDefaultsUtil {
    static let userDefaults = UserDefaults.standard
    private static let KeyReminder = "Reminder"
    
    static var reminders: Reminders? {
        set {
            if let v = newValue {
                userDefaults.set(NSKeyedArchiver.archivedData(withRootObject: v), forKey: KeyReminder)
                userDefaults.synchronize()
            }
        }
        get {
            if let data = userDefaults.object(forKey: KeyReminder) as? Data {
                let rs = NSKeyedUnarchiver.unarchiveObject(with: data) as! Reminders
                return rs
            }
            return nil
        }
    }
}
