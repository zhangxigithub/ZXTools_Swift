//
//  UIView+Constraint.swift
//  xin
//
//  Created by zhangxi on 11/5/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit

public extension UIView
{
    public func widthConstraints() -> Array<NSLayoutConstraint>
    {
        var result = [NSLayoutConstraint]()
        for c in self.constraints
        {
            if c.firstAttribute == .Width &&
                (c.firstItem as? NSObject) == self &&
                c.secondAttribute == .NotAnAttribute &&
                (c.secondItem as? NSObject) == nil
            {
                result.append(c)
            }
        }
        return result
    }
    
    public func heightConstraints() -> Array<NSLayoutConstraint>
    {
        var result = [NSLayoutConstraint]()
        for c in self.constraints
        {
            if c.firstAttribute == .Height &&
                (c.firstItem as? NSObject) == self &&
                c.secondAttribute == .NotAnAttribute &&
                (c.secondItem as? NSObject) == nil
            {
                result.append(c)
            }
        }
        return result
    }
    
    public func fitWidth()
    {
        let size = self.sizeThatFits(CGSizeZero)
        changeWidth(size.width)
    }
    
    public func fitHeight()
    {
        let size = self.sizeThatFits(CGSizeZero)
        changeWidth(size.height)
    }
    public func changeWidth(width:CGFloat)
    {
        self.widthConstraints().forEach {
            $0.constant = width
        }
    }
    
    public func changeHeight(height:CGFloat)
    {
        self.widthConstraints().forEach {
            $0.constant = height
        }
    }
    
    
    public func constraint(identifier:String) -> NSLayoutConstraint?
    {
        for c in self.constraints
        {
            if c.identifier == identifier
            {
                return c
            }
        }

        return nil
    }
    
    public func constraintInSubviews(identifier:String) -> NSLayoutConstraint?
    {
        var c = self.constraint(identifier)
        
        if c != nil
        {
            return c
        }else
        {
            for subview in self.subviews
            {
                c = subview.constraintInSubviews(identifier)
                if c != nil
                {
                    return c
                }
            }
        }
        return nil
    }

}
