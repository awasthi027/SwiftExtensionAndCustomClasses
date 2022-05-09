//
//  MessageSender.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 02/04/22.
//


import UIKit

enum MessageSenderName: String {
   case navigateOnAddMoney = "navigateOnAddMoney"
   case appBecomeActive = "applicationBecomeActive"
}

protocol MessageSenderCallBack {
    func unSubscribeMessage(_ controller: UIViewController, name: MessageSenderName)
    func postMessage(_ name: MessageSenderName)
}
extension MessageSenderCallBack {
  
    func unSubscribeMessage(_ controller: UIViewController, name: MessageSenderName) {
        NotificationCenter.default
            .removeObserver(controller, name:  NSNotification.Name(name.rawValue), object: nil)
    }
    func postMessage(_ name: MessageSenderName) {
        NotificationCenter.default
                           .post(name: NSNotification.Name(name.rawValue),
                            object: nil)
    }
}
extension UIViewController {
    func subscribeMessage(_ controller: UIViewController, name: MessageSenderName) {
        NotificationCenter.default
                          .addObserver(self,
                                       selector: #selector(self.messageSenderCallBack),
                                       name: NSNotification.Name (name.rawValue),
                                       object: nil)
    }
    @objc func messageSenderCallBack() {
       // super.inputViewController?.messageSenderCallBack()
    }
}



