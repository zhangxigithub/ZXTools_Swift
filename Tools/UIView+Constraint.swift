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
    func constraint(identifier:String) -> NSLayoutConstraint?
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
    
    func constraintInSubviews(identifier:String) -> NSLayoutConstraint?
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
