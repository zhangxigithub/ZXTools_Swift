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
    public func widthConstraint() -> NSLayoutConstraint?
    {
        for c in self.constraints
        {
            if c.firstAttribute == .Width &&
                (c.firstItem as? NSObject) == self &&
                c.secondAttribute == .NotAnAttribute &&
                (c.secondItem as? NSObject) == nil
            {
                return c
            }
        }
        return nil
    }
    public func heightConstraint() -> NSLayoutConstraint?
    {
        for c in self.constraints
        {
            if c.firstAttribute == .Height &&
                (c.firstItem as? NSObject) == self &&
                c.secondAttribute == .NotAnAttribute &&
                (c.secondItem as? NSObject) == nil
            {
                return c
            }
        }
        return nil
    }
    
    public func fitWidth()
    {
        let size = self.sizeThatFits(CGSizeZero)
        self.widthConstraint()?.constant = size.width
    }
    public func fitHeight()
    {
        let size = self.sizeThatFits(CGSizeZero)
        self.heightConstraint()?.constant = size.height
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
