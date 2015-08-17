//
//  BaseContentController.swift
//  History
//
//  Created by Stuart Hearn on 10/08/2015.
//  Copyright (c) 2015 Cleverlink Ltd. All rights reserved.
//

import UIKit

class BaseContentController: UIViewController {

    var backgroundImageView = UIImageView(frame: CGRectZero)
    var backgroundImage: UIImage? = nil {
        didSet { self.backgroundImageView.image = self.backgroundImage }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.backgroundImageView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.backgroundImageView.frame = self.view.bounds        
    }
}
