//
//  MenuItem.swift
//  ISChat
//
//  Created by Khaled Khaldi on 9/24/18.
//  Copyright © 2018 iPhoneAlsham. All rights reserved.
//

import UIKit

class MenuItem: NSObject {

    var title: String?
    var subTitle: String?
    var image: UIImage?
    var accessoryView:UIView?
    
    var canHighlight: Bool = true
    // var indexPath: IndexPath?
    var selected: Bool
    
    typealias MenuItemAction = (_ indexPath: IndexPath) -> Void
    var action: MenuItemAction?
    
    init(title: String?,
         subTitle: String? = nil,
         image: UIImage? = nil,
         accessoryView: UIView? = nil,
         canHighlight: Bool = true,
         selected: Bool = false,
         action: @escaping MenuItemAction) {
        
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.accessoryView = accessoryView
        self.canHighlight = canHighlight
        self.selected = selected
        self.action = action
        
    }
    
}
