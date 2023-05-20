//
//  ViewController.swift
//  StretchingPicture
//
//  Created by Андрей Фроленков on 19.05.23.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.alwaysBounceVertical = true
    scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 90)
    
    scrollView.contentInsetAdjustmentBehavior = .never
    scrollView.delegate = self
 
    return scrollView
  }()
  
  lazy var scrollImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Image")
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(scrollView)
    self.scrollView.addSubview(scrollImageView)
    
    scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    scrollImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 270)
    
  }

}

extension ViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let changeY = -scrollView.contentOffset.y
    print(changeY)
    var width = view.frame.width + changeY * 2
    width = max(view.frame.width, width)
    
    scrollImageView.frame = CGRect(x: min(0, -changeY), y: min(0, -changeY), width: width, height: 270 + changeY * 2)
    scrollView.scrollIndicatorInsets = UIEdgeInsets(top: self.scrollImageView.frame.height - 55, left: 0, bottom: 0, right: 0)
    
    if changeY < 0 {
      
      scrollView.scrollIndicatorInsets = UIEdgeInsets(top: self.scrollImageView.frame.height - 55, left: 0, bottom: -changeY * 7, right: 0)
    }
  }
  
  
}
