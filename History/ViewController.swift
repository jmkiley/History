//
//  ViewController.swift
//  History
//
//  Created by Stuart Hearn on 06/08/2015.
//  Copyright (c) 2015 Cleverlink Ltd. All rights reserved.
//

import UIKit

func delay(#seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let records = [anubis, sphinx, tut, pyramids]
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        changeModelDataTo(self.records[self.currentIndex], animated: false)
    }


    func revolveData() {
        // rotate index
        currentIndex++
        if currentIndex >= records.count {
            currentIndex=0
        }
        
        let record = self.records[currentIndex]
        changeModelDataTo(record, animated: true)
    }
    
    func changeModelDataTo(data: ModelData, animated: Bool = false) {
    
        let toImage = UIImage(named: data.imageName)!
        
        if animated {
            fadeImageView(self.imageView, toImage: toImage, showEffects: true)
        } else {
            self.imageView.image = toImage
        }
        
        delay(seconds: 3.0) {
            self.revolveData()
        }
    }
    
    
    func fadeImageView(imageView: UIImageView, toImage: UIImage, showEffects: Bool) {
    
        UIView.transitionWithView(imageView, duration: 1.0, options: .TransitionCrossDissolve, animations: {
            imageView.image = toImage
        }, completion: nil)
    }
}

