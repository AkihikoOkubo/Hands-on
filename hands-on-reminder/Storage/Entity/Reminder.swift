//
//  Remainder.swift
//  hands-on-reminder
//
//  Created by Akihiko Okubo on 2018/12/17.
//  Copyright © 2018年 akihiko.com. All rights reserved.
//

import Foundation

class Reminders: NSObject, NSCoding {
    var reminders: [Reminder] = []
    
    init(reminders: [Reminder]) {
        self.reminders = reminders
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.reminders, forKey: "reminders")
    }
    
    required init?(coder aDecoder: NSCoder) {
        reminders = aDecoder.decodeObject(forKey: "reminders") as! Array<Reminder>
    }
}

class Reminder: NSObject, NSCoding {
    
    var name: String = ""
    var text: String = ""
    var timestamp: Date = Date()
    
    init(name: String, text: String, timestamp: Date) {
        self.name = name
        self.text = text
        self.timestamp = timestamp
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.text, forKey: "text")
        aCoder.encode(self.timestamp, forKey: "timestamp")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.text = aDecoder.decodeObject(forKey: "text") as! String
        self.timestamp = aDecoder.decodeObject(forKey: "timestamp") as! Date
    }
    
}

