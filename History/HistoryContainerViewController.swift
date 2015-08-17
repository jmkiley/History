//
//  HistoryContainerViewController.swift
//  History
//
//  Created by Stuart Hearn on 07/08/2015.
//  Copyright (c) 2015 Cleverlink Ltd. All rights reserved.
//

import UIKit

class HistoryContainerViewController: UIViewController {
    
    @IBOutlet weak var topMenuView: UIView!
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var toggleMenuBBI: UIBarButtonItem!
    
    @IBOutlet weak var topMenuHeightConstraint: NSLayoutConstraint!
    
    var areMenusOpen = false
    let closeMenuHeight: CGFloat = 0.0
    let openMenuHeight: CGFloat = 100.0
    var slider: HorizontalItemList!
    var topMenuImageNames = ["rulers", "people", "language", "religion", "sites"]
    var contentControllers = [ RulersContentViewController(), PeopleContentViewController(), LanguageContentViewController(), ReligionContentViewController(), SitesContentViewController() ]
    
    var containerViewChildVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        self.containerView.backgroundColor = UIColor.blackColor()
    }
    

    private func addChildVC( childVC: UIViewController ) {
        self.containerViewChildVC = childVC
        
        // setup the VC hierarchy to include this childVc
        addChildViewController(self.containerViewChildVC)
        
        // child root view mapped in container view
        self.containerViewChildVC.view.frame = self.containerView.bounds
        
        // add the child's root view into the view hierarchy
        self.containerView.addSubview(self.containerViewChildVC.view)
        
        self.containerViewChildVC.didMoveToParentViewController(self)
    }
    
    private func removeCurrentChildVC() {
        if self.containerViewChildVC != nil {
            self.containerViewChildVC.view.removeFromSuperview()
            self.containerViewChildVC.removeFromParentViewController()
            self.containerViewChildVC = nil
        }
    }
    
    private func swapChildVCForMenuIndex( index: Int ) {
        self.removeCurrentChildVC()
        let imageName = self.topMenuImageNames[index]
        let contentVC = self.contentControllers[index] as BaseContentController
        contentVC.backgroundImage = UIImage(named: imageName)
        self.addChildVC(contentVC)
    }
    
    @IBAction func toggleMenuBBIpressed(sender: AnyObject?) {
        
        self.areMenusOpen = !self.areMenusOpen
        
        if self.areMenusOpen {
            // expand top menus
            self.topMenuHeightConstraint.constant = self.openMenuHeight
        } else {
            // shrink top menus to HIDDEN
            self.topMenuHeightConstraint.constant = self.closeMenuHeight
        }
        
        UIView.animateWithDuration(5.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: .CurveEaseIn, animations: {
            self.view.layoutIfNeeded()
            //let angle = self.areMenusOpen ? CGFloat(M_PI_4) : 0.0
            //self.toggleMenuBBI.transform = CGAffineTransformMakeRotation(angle)
        }, completion: nil)
        
        if self.areMenusOpen {
            self.slider = HorizontalItemList(inView: self.topMenuView, imageNameArray: self.topMenuImageNames, withTotalHeight: self.openMenuHeight, andPadding: 0.0)
            self.slider.didSelectItem = { index in
                println( "\(index) image selected" )
                self.swapChildVCForMenuIndex(index)
                //self.toggleMenuBBIpressed(nil)
            }
            self.topMenuView.addSubview(self.slider)
        } else {
            self.slider.removeFromSuperview()
        }
    }
}
