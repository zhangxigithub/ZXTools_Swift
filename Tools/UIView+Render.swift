//
//  UIView+Render.swift
//  Render
//
//  Created by 张玺 on 6/22/16.
//  Copyright © 2016 me.zhangxi. All rights reserved.
//

import UIKit



public extension UIView
{
    enum RenderType {
        case uiView
        case uiLabel
        case uiImageView
        case uiButton
        case uiSwitch
        case uiSegmentedControl
        case uiSlider
        case uiActivityIndicatorView
        case uiProgressView
        case uiStepper
        case uiTableView
        case uiCollectionView
        case uiScrollView
        case uiWebView
        case uiTextView
        case uiTextField
    }
    
    subscript (tag:Int) -> AnyObject?
        {
        get {
            return self.viewWithTag(tag)
        }
    }
    
    
    func view(_ tag:Int) -> UIView?
    {
        return self[tag] as? UIView
    }
    func lable(_ tag:Int) -> UILabel?
    {
        return self[tag] as? UILabel
    }
    func imageView(_ tag:Int) -> UIImageView?
    {
        return self[tag] as? UIImageView
    }
    func button(_ tag:Int) -> UIButton?
    {
        return self[tag] as? UIButton
    }
    func textView(_ tag:Int) -> UITextView?
    {
        return self[tag] as? UITextView
    }
    func textField(_ tag:Int) -> UITextField?
    {
        return self[tag] as? UITextField
    }
    func segmentedControl(_ tag:Int) -> UISegmentedControl?
    {
        return self[tag] as? UISegmentedControl
    }
    
    func slider(_ tag:Int) -> UISlider?
    {
        return self[tag] as? UISlider
    }
    
    func activityIndicatorView(_ tag:Int) -> UIActivityIndicatorView?
    {
        return self[tag] as? UIActivityIndicatorView
    }
    
    func progressView(_ tag:Int) -> UIProgressView?
    {
        return self[tag] as? UIProgressView
    }
    
    func stepper(_ tag:Int) -> UIStepper?
    {
        return self[tag] as? UIStepper
    }
    
    func tableView(_ tag:Int) -> UITableView?
    {
        return self[tag] as? UITableView
    }
    
    func collectionView(_ tag:Int) -> UICollectionView?
    {
        return self[tag] as? UICollectionView
    }
    
    func scrollView(_ tag:Int) -> UIScrollView?
    {
        return self[tag] as? UIScrollView
    }
    
    func webView(_ tag:Int) -> UIWebView?
    {
        return self[tag] as? UIWebView
    }
    
    

    
    
    
    func tap(_ target: AnyObject?, action: Selector) -> UITapGestureRecognizer
    {
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
        return tap
    }
    
    
    class func xib(_ xib:String) -> UIView?
    {
        let views = Bundle.main.loadNibNamed(xib, owner: nil, options: nil)
        return views!.first as? UIView
    }
    
    
    func renderLabels(_ data:Dictionary<Int,String>) -> UIView
    {
        for (tag,value) in data
        {
            self.lable(tag)?.text = value
        }
        return self
    }
    
}
