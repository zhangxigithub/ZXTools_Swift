//
//  UIView+ZXQuartz.swift
//  demo
//
//  Created by zhangxi on 12/2/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit


public extension UIView
{
    //矩形、圆角矩形 rect
    func zx_drawRect(_ rect:CGRect,radius:Float=0,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        let context = UIGraphicsGetCurrentContext()
        let path    = self.path(rect, radius: radius)
        context!.addPath(path)
        context!.drawPath(using: fillMode)
    }


    //Polygon
    func drawPolygon(_ points:Array<CGPoint>,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        assert(points.count >= 2, "The count of points must be more than 2.")

        let context = UIGraphicsGetCurrentContext()
        let start = points.first!
        
        for (i,point) in points.enumerated()
        {
            if i == 0
            {
                context!.move(to: CGPoint(x: point.x, y: point.y));
            }
            else if i == points.count - 1
            {
                context!.addLine(to: CGPoint(x: point.x, y: point.y));
            }else
            {
                context!.addLine(to: CGPoint(x: start.x, y: start.y));
            }
        }
        context!.drawPath(using: fillMode)
    }
    
    
    func drawCircle(_ center:CGPoint,radius:Float,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        drawArc(center, radius: radius, start: 0, end: Float.pi * 2,fillMode:fillMode)
    }
    func drawArc(_ center:CGPoint,radius:Float,start:Float,end:Float,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        assert(radius > 0, "The cradius must be more than 0.")
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.addArc(center: center,
                        radius: CGFloat(radius),
                        startAngle: CGFloat(start),
                        endAngle: CGFloat(end),
                        clockwise: true)
        
        context?.drawPath(using: fillMode)
    }
    
    func drawBezierCurve(_ start:CGPoint,end:CGPoint,control1:CGPoint,control2:CGPoint,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: start.x, y: start.y));
        context?.addCurve(to: end, control1: control1, control2: control2)
        context?.drawPath(using: fillMode)
    }
    
    func drawLine(_ start:CGPoint,end:CGPoint,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        drawLines([start,end], fillMode: fillMode)
    }
    func drawLines(_ points:Array<CGPoint>,fillMode:CGPathDrawingMode=CGPathDrawingMode.fillStroke)
    {
        assert(points.count >= 0, "The count of points must be more than 2.")

        let context = UIGraphicsGetCurrentContext()
        
        for (i,point) in points.enumerated()
        {
            if i == 0
            {
                context!.move(to: CGPoint(x: point.x, y: point.y));
            }else
            {
                context!.addLine(to: CGPoint(x: point.x, y: point.y));
            }
        }
        context!.drawPath(using: fillMode)
    }

    
    func drawImage(_ image:UIImage,point:CGPoint, blendMode: CGBlendMode = CGBlendMode.normal, alpha: CGFloat=1)
    {
        image.draw(at: point, blendMode: blendMode, alpha: alpha)
    }
    func drawString()
    {
        assert(false, "unfinish.")
    }
    
    func drawShadow(_ offset:CGSize, blur:CGFloat, color:CGColor?=nil)
    {
        let context = UIGraphicsGetCurrentContext()
        context!.setShadow(offset: offset, blur: blur, color: color)
    }

    func path(_ frame:CGRect,radius:Float) -> CGMutablePath
    {
        
        var x1,x2,x3,x4,y1,y2,y3,y4,y5,y6,y7,y8:CGPoint
        //y为4个控制点
        //从左上角顶点开始，顺时针旋转,x1->y1->y2->x2
        
        let r = CGFloat(radius)
        
        x1 = frame.origin;
        x2 = CGPoint(x: frame.origin.x+frame.size.width, y: frame.origin.y);
        x3 = CGPoint(x: frame.origin.x+frame.size.width, y: frame.origin.y+frame.size.height);
        x4 = CGPoint(x: frame.origin.x                 , y: frame.origin.y+frame.size.height);
        
        
        y1 = CGPoint(x: frame.origin.x+r, y: frame.origin.y);
        y2 = CGPoint(x: frame.origin.x+frame.size.width-r, y: frame.origin.y);
        y3 = CGPoint(x: frame.origin.x+frame.size.width, y: frame.origin.y+r);
        y4 = CGPoint(x: frame.origin.x+frame.size.width, y: frame.origin.y+frame.size.height-r);
        
        y5 = CGPoint(x: frame.origin.x+frame.size.width-r, y: frame.origin.y+frame.size.height);
        y6 = CGPoint(x: frame.origin.x+r, y: frame.origin.y+frame.size.height);
        y7 = CGPoint(x: frame.origin.x, y: frame.origin.y+frame.size.height-r);
        y8 = CGPoint(x: frame.origin.x, y: frame.origin.y+r);
        
        let pathRef = CGMutablePath()
        
        if (r <= 0) {
            
            pathRef.move(to: x1)
            pathRef.addLine(to: x2)
            pathRef.addLine(to: x3)
            pathRef.addLine(to: x4)
            /*
            CGPathMoveToPoint(pathRef,    nil, x1.x,x1.y);
            CGPathAddLineToPoint(pathRef, nil, x2.x,x2.y);
            CGPathAddLineToPoint(pathRef, nil, x3.x,x3.y);
            CGPathAddLineToPoint(pathRef, nil, x4.x,x4.y);
             */
        }else
        {
            
            pathRef.move(to: y1)
            pathRef.addLine(to: y2)
            
            pathRef.addArc(tangent1End: x2, tangent2End: y3, radius: r)
            pathRef.addLine(to: y4)
            
            pathRef.addArc(tangent1End: x3, tangent2End: y5, radius: r)
            pathRef.addLine(to: y6)
            
            pathRef.addArc(tangent1End: x4, tangent2End: y7, radius: r)
            pathRef.addLine(to: y8)
            
            pathRef.addArc(tangent1End: x1, tangent2End: y1, radius: r)
            
            /*
 
            CGPathMoveToPoint(pathRef,    nil, y1.x,y1.y);
            CGPathAddLineToPoint(pathRef, nil, y2.x,y2.y);
            
            
            CGPathAddArcToPoint(pathRef, nil,  x2.x,x2.y,y3.x,y3.y,r);
            CGPathAddLineToPoint(pathRef, nil, y4.x,y4.y);
            
            CGPathAddArcToPoint(pathRef, nil,  x3.x,x3.y,y5.x,y5.y,r);
            
            CGPathAddLineToPoint(pathRef, nil, y6.x,y6.y);
            CGPathAddArcToPoint(pathRef, nil,  x4.x,x4.y,y7.x,y7.y,r);
            
            CGPathAddLineToPoint(pathRef, nil, y8.x,y8.y);
            CGPathAddArcToPoint(pathRef, nil,  x1.x,x1.y,y1.x,y1.y,r);
            */
        }
        
        
        pathRef.closeSubpath();
        return pathRef;
    }

}
