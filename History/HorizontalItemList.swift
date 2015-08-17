/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

//
// A scroll view, which loads all 10 images, and has a callback
// for when the user taps on one of the images
//
class HorizontalItemList: UIScrollView {
  
  var didSelectItem: ((index: Int)->())?
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
    convenience init(inView: UIView, imageNameArray: [String], withTotalHeight totalHeight: CGFloat, andPadding padding:CGFloat) {
        
    // make each menu item "(height - 2.0*padding) ^ 2"
    let bHeight = totalHeight - (2.0 * padding)
    let bWidth = bHeight
    let rect = CGRect(x: inView.bounds.width, y: 0, width: inView.frame.width, height: totalHeight)
        
    self.init(frame: rect)
    
    self.alpha = 0.0
    
    for var i = 0; i < imageNameArray.count; i++ {
        let image = UIImage(named: "\(imageNameArray[i])")
        let imageView  = UIImageView(image: image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        //imageView.center = CGPoint(x: CGFloat(i) * buttonWidth + buttonWidth/2, y: buttonWidth/2)
        imageView.center = CGPoint(x: padding + CGFloat(i) * (bWidth+padding) + bWidth/2, y: padding + bHeight/2)
        imageView.tag = i
        imageView.userInteractionEnabled = true
        addSubview(imageView)
        let tap = UITapGestureRecognizer(target: self, action: Selector("didTapImage:"))
        imageView.addGestureRecognizer(tap)
    }
        
    contentSize = CGSize(width: padding + (CGFloat(imageNameArray.count) * bWidth) + padding, height:  bHeight + 2*padding)
  }
  
  func didTapImage(tap: UITapGestureRecognizer) {
    didSelectItem?(index: tap.view!.tag)
  }
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    if superview == nil {
      return
    }
    
    UIView.animateWithDuration(3.0, delay: 0.01, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: .CurveEaseIn, animations: {
      self.alpha = 1.0
      self.center.x -= self.frame.size.width
      }, completion: nil)
  }
}