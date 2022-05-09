//
//  UITableView+Extension.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 27/03/22.
//


import UIKit


extension UITableView {
    
    func scrollTableOnDidTextEditing() {
        var frame = self.frame
        frame.origin.y = 216.0
        self.self.scrollRectToVisible(frame, animated: true)
    }
    var isLoadMoreActive: Bool {
        return self.contentSize.height > self.frame.size.height
    }
}
