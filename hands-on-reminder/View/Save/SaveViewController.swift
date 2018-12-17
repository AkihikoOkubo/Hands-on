//
//  SaveViewController.swift
//  hands-on-reminder
//
//  Created by Akihiko Okubo on 2018/12/17.
//  Copyright © 2018年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class SaveViewController: UIViewController {
    
    static func make() -> SaveViewController {
        return UIStoryboard(name: "Save", bundle: nil).instantiateInitialViewController()! as! SaveViewController
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        // TODO
        // 登録された情報をからReminderオブジェクトを作る
        // UserDefaultsUtil.remindersからRemindersオブジェクトを取得する
        // RemindersオブジェクトにReminderオブジェクトを追加する
        // UserDefaultsUtil.remindersに設定する
        
        /* ローカル通知の模擬実装 */
        let trigger: UNNotificationTrigger
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()
        
        // めっちゃ適当な実装
        let s = Calendar.current.component(.second, from: Date())
        let h = Calendar.current.component(.hour, from: Date())
        let m = Calendar.current.component(.minute, from: Date())
        
        // ↓これは三項演算子と言います
        notificationTime.hour = h
        notificationTime.minute = m
        notificationTime.second = s + 5
        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        // 通知内容の設定
        content.title = "test"
        content.body = "testです"
        content.sound = UNNotificationSound.default
        
        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        // 通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
}
