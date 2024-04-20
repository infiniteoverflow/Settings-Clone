//
//  SettingTableViewCell.swift
//  tableViewDemo
//
//  Created by Aswin Gopinathan on 20/04/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    var hidesBottomSeparator = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bottomSeparator = subviews.first { $0.frame.minY >= bounds.maxY - 1 && $0.frame.height <= 1 }
        bottomSeparator?.isHidden = hidesBottomSeparator
    }
}
