//
//  UITableViewCellExtension.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-19.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var stringIdentifier: String {
        get {
            return String(describing: self)
        }
    }
    
}
