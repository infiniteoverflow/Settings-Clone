//
//  SettingsModel.swift
//  tableViewDemo
//
//  Created by Aswin Gopinathan on 20/04/24.
//

import Foundation
import UIKit

struct SettingsModel {
    var text: String
    var accessoryText: String = ""
    var switchShown: Bool? = false
    var image: String? = nil
    var enabled: Bool? = true
    var imageTintColor: UIColor? = nil
}
