//
//  UIView+Render.swift
//  Render
//
//  Created by 张玺 on 6/22/16.
//  Copyright © 2016 me.zhangxi. All rights reserved.
//

import UIKit

class RenderView: UIView {
    
    
    
}


extension UIView
{
    enum RenderType {
        case UIView
        case UILabel
        case UIImageView
        case UIButton
        case UISwitch
        case UISegmentedControl
        case UISlider
        case UIActivityIndicatorView
        case UIProgressView
        case UIStepper
        case UITableView
        case UICollectionView
        case UIScrollView
        case UIWebView
        case UITextView
        case UITextField
    }
    
    subscript (tag:Int) -> AnyObject?
        {
        get {
            return self.viewWithTag(tag)
        }
    }
    
    
    func view(tag:Int) -> UIView?
    {
        return self[tag] as? UIView
    }
    func lable(tag:Int) -> UILabel?
    {
        return self[tag] as? UILabel
    }
    func imageView(tag:Int) -> UIImageView?
    {
        return self[tag] as? UIImageView
    }
    func button(tag:Int) -> UIButton?
    {
        return self[tag] as? UIButton
    }
    func textView(tag:Int) -> UITextView?
    {
        return self[tag] as? UITextView
    }
    func textField(tag:Int) -> UITextField?
    {
        return self[tag] as? UITextField
    }
    func segmentedControl(tag:Int) -> UISegmentedControl?
    {
        return self[tag] as? UISegmentedControl
    }
    
    func slider(tag:Int) -> UISlider?
    {
        return self[tag] as? UISlider
    }
    
    func activityIndicatorView(tag:Int) -> UIActivityIndicatorView?
    {
        return self[tag] as? UIActivityIndicatorView
    }
    
    func progressView(tag:Int) -> UIProgressView?
    {
        return self[tag] as? UIProgressView
    }
    
    func stepper(tag:Int) -> UIStepper?
    {
        return self[tag] as? UIStepper
    }
    
    func tableView(tag:Int) -> UITableView?
    {
        return self[tag] as? UITableView
    }
    
    func collectionView(tag:Int) -> UICollectionView?
    {
        return self[tag] as? UICollectionView
    }
    
    func scrollView(tag:Int) -> UIScrollView?
    {
        return self[tag] as? UIScrollView
    }
    
    func webView(tag:Int) -> UIWebView?
    {
        return self[tag] as? UIWebView
    }
    
    

    
    
    
    
    
    
    
    class func xib(xib:String) -> UIView?
    {
        let views = NSBundle.mainBundle().loadNibNamed(xib, owner: nil, options: nil)
        return views.first as? UIView
    }
    
    
    func renderLabels(data:Dictionary<Int,String>) -> UIView
    {
        for (tag,value) in data
        {
            self.lable(tag)?.text = value
        }
        return self
    }
    
}
