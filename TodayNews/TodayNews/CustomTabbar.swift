//
//  CustomTabbar.swift
//  TodayNews
//
//  Created by LXN on 2019/3/21.
//  Copyright © 2019年 LXN. All rights reserved.
//

import UIKit

class CustomTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var publishButton:UIButton = {
        let publishButton = UIButton(type: .custom)
        
        return publishButton;
    }()

}
