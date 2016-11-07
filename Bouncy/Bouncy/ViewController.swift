//
//  ViewController.swift
//  Bouncy
//
//  Created by Anak Mirasing on 10/30/2559 BE.
//  Copyright © 2559 iGROOMGRiM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let numberOfViews = 3
    
    var startingXOffset: CGFloat = 0
    var endingOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = numberOfViews
        pageControl.currentPage = 0
        
        let green = UIColor(red:0.32, green:0.87, blue:0.46, alpha:1.0)
        let blue = UIColor(red:0.11, green:0.08, blue:1.00, alpha:1.0)
        
        for i in 0..<numberOfViews {
            let xOrgin = CGFloat(i) * self.view.frame.width
            let bgFrame = CGRect(x: xOrgin, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
            if i % 2 == 0 {
                let view = BGView(frame: bgFrame, colors: [green, blue])
                scrollView.addSubview(view)
            } else {
                let view = BGView(frame: bgFrame, colors: [blue, green])
                scrollView.addSubview(view)
            }
            
            let contentView = ContentView(frame: CGRect(x: xOrgin + 32, y: 64, width: self.view.frame.width - 64, height: self.view.frame.height - 128))
            scrollView.addSubview(contentView)
        }
        
        scrollView.backgroundColor = green

        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: CGFloat(numberOfViews) * self.view.frame.width, height: self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingXOffset = scrollView.contentOffset.x
        print("scrollViewWillBeginDragging : \(startingXOffset)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let xOffset = scrollView.contentOffset.x
        let dif = abs(startingXOffset - xOffset)
        print("dif : \(dif)")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        endingOffset = scrollView.contentOffset.x
        let sizeWidth = scrollView.bounds.size.width
        
        print("scrollViewDidEndDragging : \(endingOffset)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let xOffset = scrollView.contentOffset.x
        let sizeWidth = scrollView.bounds.size.width
        pageControl.currentPage = Int(xOffset/sizeWidth)
        
        print("scrollViewDidEndDecelerating : \(xOffset)")
    }
}

