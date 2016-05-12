//
//  extensionTable.swift
//  hongpatu
//
//  Created by 蔡斯仪 on 15/9/7.
//  Copyright (c) 2015年 caisiyi. All rights reserved.
//

import UIKit

extension UITableView{
    convenience init(VC:UIViewController){
        self.init()
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.separatorStyle = UITableViewCellSeparatorStyle.None
    }
}
